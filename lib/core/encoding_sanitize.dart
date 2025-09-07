import 'dart:convert';

// Decode raw HTTP bytes → String safely (keeps app from crashing on bad bytes)
String decodeUtf8Bytes(List<int> bytes) =>
    utf8.decode(bytes, allowMalformed: true);

// Public entry for all mentor text
String cleanMentorText(String s) => _paragraphize(s);

// Precompiled regex for perf
final _reSmartApo = RegExp(r'(â€™|Ã¢â‚¬â„¢|â\u0080\u0099)');
final _reSmartApoOpen = RegExp(r'(â€˜|Ã¢â‚¬Ëœ|â\u0080\u0098)');
final _reSmartDq = RegExp(r'(â€œ|Ã¢â‚¬Å"|â\u0080\u009C)');
final _reSmartDqClose = RegExp(r'(â€|Ã¢â‚¬Â"|â\u0080\u009D)');
final _reEmDash = RegExp(r'(â€"|Ã¢â‚¬â"¢|â\u0080\u0094)');
final _reEnDash = RegExp(r'(â€"|Ã¢â‚¬â€œ|â\u0080\u0093)');
final _reEllipsis = RegExp(r'(â€¦|Ã¢â‚¬Â¦)');
final _reTimes = RegExp(r'(Ã—)'); // ×
final _reDivide = RegExp(r'(Ã·)'); // ÷
final _reRoots = RegExp(r'Â+'); // stray Â
final _reZws = RegExp(r'[\u200B-\u200D\uFEFF\u200E\u200F]'); // includes LRM/RLM

String _killMojibake(String s) => s
    .replaceAll(_reRoots, '')
    .replaceAll(_reSmartApo, "'")
    .replaceAll(_reSmartApoOpen, "'")
    .replaceAll(_reSmartDq, '"')
    .replaceAll(_reSmartDqClose, '"')
    .replaceAll(_reEmDash, '—')
    .replaceAll(_reEnDash, '–')
    .replaceAll(_reEllipsis, '…')
    .replaceAll(_reTimes, '×')
    .replaceAll(_reDivide, '÷')
    .replaceAll('\u00A0', ' ')
    .replaceAll(_reZws, '');

String _paragraphize(String input) {
  var t = _killMojibake(input);

  // Normalize bullets without injecting an extra leading newline
  t = t.replaceAllMapped(
    RegExp(r'(^|\n)\s*(?:-|\u2022|\*)\s+'),
    (m) => '${m.group(1)}• ',
  );

  // Gentle whitespace cleanup with tighter paragraph spacing
  t = t
      .replaceAll(RegExp(r'[ \t]+\n'), '\n') // Remove trailing spaces
      .replaceAll(RegExp(r'\n{3,}'), '\n\n') // Max 2 line breaks
      .trim();

  return t;
}
