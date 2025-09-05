import 'dart:js' as js;

class WebOcrBridge {
  Future<String> pickAndOcr() async {
    final result = await js.context.callMethod('pickAndOcr', []);
    if (result is String) return result;
    return '';
  }
} 