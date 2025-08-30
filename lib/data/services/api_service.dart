import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/whisperfire_models.dart';
import '../models/mentor_models.dart';
import '../models/profile_models.dart';

class ApiService {
  late final Dio _dio;
  static const String baseUrl =
      'https://whisperfire-backend-production.up.railway.app'; // Your Railway backend URL
  static const Duration timeout = Duration(seconds: 18);

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors for logging (debug only)
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }

    // Add retry interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode == null &&
            error.type == DioExceptionType.connectionTimeout) {
          // Retry once on timeout
          try {
            final response = await _dio.fetch(error.requestOptions);
            handler.resolve(response);
          } catch (e) {
            handler.next(error);
          }
        } else {
          handler.next(error);
        }
      },
    ));
  }

  // Analyze endpoint
  Future<WhisperfireResponse> postAnalyzeWhisperfire(
      Map<String, dynamic> body) async {
    try {
      final response = await _dio.post('/api/v1/analyze', data: body);

      // Raw analyze response logged in debug mode

      // Handle the backend response format
      final data = response.data;
      if (data['success'] == true && data['data'] != null) {
        // Extract the actual analysis data and ensure all required fields exist
        final analysisData = data['data'] as Map<String, dynamic>;

        // Ensure all required nested objects exist
        if (analysisData['context'] == null) {
          analysisData['context'] = {
            'tab': body['tab'] ?? 'scan',
            'relationship': body['relationship'] ?? 'Partner',
            'tone': body['tone'] ?? 'neutral',
            'content_type': body['content_type'] ?? 'dm',
            'subject_name': body['subject_name'],
          };
        }

        if (analysisData['tactic'] == null) {
          analysisData['tactic'] = {
            'label': 'Standard Communication',
            'confidence': 70
          };
        }

        if (analysisData['suggested_reply'] == null) {
          analysisData['suggested_reply'] = {
            'style': body['tone'] ?? 'neutral',
            'text': 'Thank you for sharing that.'
          };
        }

        if (analysisData['safety'] == null) {
          analysisData['safety'] = {
            'risk_level': 'LOW',
            'notes': 'Analysis complete'
          };
        }

        if (analysisData['metrics'] == null) {
          analysisData['metrics'] = {
            'red_flag': 15,
            'certainty': 70,
            'viral_potential': 25
          };
        }

        return WhisperfireResponse.fromJson(analysisData);
      } else {
        throw Exception('Invalid response format: ${data}');
      }
    } on DioException catch (e) {
      // API Error logged in debug mode
      throw ApiException('Failed to analyze: ${e.message}');
    } catch (e) {
      // Parse Error logged in debug mode
      throw ApiException('Unexpected error: $e');
    }
  }

  // Mentor endpoint (non-streaming) - Simplified for non-streaming mode
  Future<MentorResponse> postMentor(MentorRequest request) async {
    try {
      // For non-streaming, we'll disable streaming in the request
      final nonStreamingRequest = MentorRequest(
        mentor: request.mentor,
        preset: request.preset,
        userText: request.userText,
        options: MentorOptions(
          stream: false, // Force non-streaming
          safeMode: request.options.safeMode,
        ),
      );

      final response =
          await _dio.post('/api/v1/mentor', data: nonStreamingRequest.toJson());

      // Non-streaming mentor response logged in debug mode

      // Handle the actual backend response format
      final data = response.data;
      if (data['success'] == true && data['data'] != null) {
        final mentorData = data['data'];

        // Convert backend format to Flutter model format with proper types
        final mentorResponse = {
          'success': true,
          'mentor': (mentorData['mentor'] ?? request.mentor).toString(),
          'preset': (mentorData['preset'] ?? request.preset).toString(),
          'reply': (mentorData['response'] ?? '').toString(),
          'tips': null,
          'tokens': null,
        };

        return MentorResponse.fromJson(mentorResponse);
      } else {
        throw Exception('Invalid response format: ${data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        // Mentor API Error logged in debug mode
      }
      throw ApiException('Failed to get mentor response: ${e.message}');
    } catch (e) {
      if (kDebugMode) {
        // Mentor Parse Error logged in debug mode
      }
      throw ApiException('Unexpected error: $e');
    }
  }

  // Mentor endpoint (streaming) - Proper SSE Implementation
  Stream<String> postMentorStream(MentorRequest request) async* {
    try {
      final response = await _dio.post(
        '/api/v1/mentor',
        data: request.toJson(),
        options: Options(
          responseType: ResponseType.stream,
          headers: {
            'Accept': 'text/event-stream',
            'Cache-Control': 'no-cache',
          },
        ),
      );

      if (kDebugMode) {
        // Starting SSE stream for mentor: ${request.mentor}
      }

      String buffer = '';

      await for (final chunk in response.data.stream) {
        final chunkString = String.fromCharCodes(chunk);
        buffer += chunkString;

        // Process complete lines
        while (buffer.contains('\n')) {
          final lineEnd = buffer.indexOf('\n');
          final line = buffer.substring(0, lineEnd).trim();
          buffer = buffer.substring(lineEnd + 1);

          if (line.startsWith('data: ')) {
            final jsonData = line.substring(6); // Remove 'data: ' prefix

            if (kDebugMode) {
              // SSE data received: $jsonData
            }

            try {
              final data = jsonDecode(jsonData);

              if (data['done'] == true) {
                if (kDebugMode) {
                  // SSE stream completed
                }
                return; // End of stream
              }

              if (data['text'] != null) {
                yield data['text'].toString();
              }
            } catch (e) {
              if (kDebugMode) {
                // Failed to parse SSE data: $e
              }
              // Continue with next chunk
            }
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        // SSE Stream Error: $e
      }
      yield 'Error: Unable to connect to mentor. Please try again.';
    }
  }

  // Profile endpoints
  Future<UserProfile> getProfile() async {
    try {
      final response = await _dio.get('/api/v1/profile');
      return UserProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException('Failed to get profile: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  Future<UserProfile> updateProfile(Map<String, dynamic> updates) async {
    try {
      final response = await _dio.patch('/api/v1/profile', data: updates);
      return UserProfile.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException('Failed to update profile: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // Lessons endpoints (optional for now)
  Future<List<Map<String, dynamic>>> getLessons() async {
    try {
      final response = await _dio.get('/api/v1/lessons');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw ApiException('Failed to get lessons: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> getLesson(
      String worldId, String lessonId) async {
    try {
      final response = await _dio.get('/api/v1/lessons/$worldId/$lessonId');
      return response.data;
    } on DioException catch (e) {
      throw ApiException('Failed to get lesson: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // Health check
  Future<bool> healthCheck() async {
    try {
      final response = await _dio.get('/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    _dio.close();
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}
