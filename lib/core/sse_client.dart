import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'encoding_sanitize.dart';

class SseClient {
  final Uri uri;
  HttpClient? _client;

  SseClient(this.uri);

  Future<StreamSubscription<List<int>>> connect({
    required void Function(Map<String, dynamic>) onEvent,
    void Function(Object, StackTrace)? onError,
    void Function()? onDone,
  }) async {
    _client ??= HttpClient()..autoUncompress = true;

    final req = await _client!.getUrl(uri);
    req.headers.set(HttpHeaders.acceptHeader, 'text/event-stream');
    req.headers.set(HttpHeaders.cacheControlHeader, 'no-cache');
    req.headers.set(HttpHeaders.connectionHeader, 'keep-alive');
    req.headers.set(HttpHeaders.acceptCharsetHeader, 'utf-8');

    final resp = await req.close();

    final controller = StreamController<List<int>>(sync: true);

    final sub = resp.listen(
      controller.add,
      onError: (e, st) => onError?.call(e, st),
      onDone: onDone,
      cancelOnError: true,
    );

    String? currentEvent;
    final dataLines = <String>[];

    controller.stream
        .transform(StreamTransformer<List<int>, String>.fromHandlers(
          handleData: (chunk, sink) {
            try {
              // Use a more robust UTF-8 decoder with error handling
              final decoder = Utf8Decoder(allowMalformed: true);
              final decoded = decoder.convert(chunk);
              sink.add(decoded);
            } catch (e) {
              // If UTF-8 decoding fails, try to recover by filtering out problematic bytes
              try {
                // Filter out bytes that might cause UTF-8 decoding issues
                final filteredChunk = chunk.where((byte) => byte < 0x80 || (byte >= 0xC0 && byte <= 0xDF) || (byte >= 0xE0 && byte <= 0xEF) || (byte >= 0xF0 && byte <= 0xF7)).toList();
                final decoder = Utf8Decoder(allowMalformed: true);
                final decoded = decoder.convert(filteredChunk);
                sink.add(decoded);
              } catch (e2) {
                // If all else fails, skip this chunk
                print('SSE: Skipping malformed UTF-8 chunk: $e2');
              }
            }
          },
        ))
        .transform(const LineSplitter())
        .listen((line) {
          if (line.isEmpty) {
            if (dataLines.isNotEmpty) {
              final payload = dataLines.join('\n').trim();
              try {
                final map = jsonDecode(payload) as Map<String, dynamic>;
                if (map['text'] is String) {
                  map['text'] = cleanMentorText(map['text'] as String);
                }
                onEvent(map);
              } catch (_) {/* ignore malformed */}
              dataLines.clear();
            }
            currentEvent = null;
            return;
          }
          if (line.startsWith(':')) return;            // heartbeat/comment
          if (line.startsWith('event:')) {
            currentEvent = line.substring(6).trim();
            return;
          }
          if (line.startsWith('data:')) {
            dataLines.add(line.substring(5));
            return;
          }
          // tolerate raw JSON lines without "data:"
          if (line.startsWith('{') || line.startsWith('[')) dataLines.add(line);
        }, onError: (e, st) => onError?.call(e, st), onDone: onDone);

    return sub;
  }

  Future<void> close() async {
    try { 
      _client?.close(force: true); 
    } catch (_) {
      // Ignore errors during close
    }
    _client = null;
  }
} 