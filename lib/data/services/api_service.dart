import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/whisperfire_models.dart';
import '../models/mentor_models.dart';
import '../models/profile_models.dart';
import '../models/settings_models.dart';

class ApiService {
  late final Dio _dio;
  static const String baseUrl = 'https://api.whisperfire.app'; // Replace with your API URL
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
        if (error.response?.statusCode == null && error.type == DioExceptionType.connectionTimeout) {
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
  Future<WhisperfireResponse> postAnalyzeWhisperfire(Map<String, dynamic> body) async {
    try {
      final response = await _dio.post('/api/v1/analyze', data: body);
      return WhisperfireResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('API Error: ${e.message}');
        print('Response: ${e.response?.data}');
      }
      throw ApiException('Failed to analyze: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // Mentor endpoint (non-streaming)
  Future<MentorResponse> postMentor(MentorRequest request) async {
    try {
      final response = await _dio.post('/api/v1/mentor', data: request.toJson());
      return MentorResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Mentor API Error: ${e.message}');
        print('Response: ${e.response?.data}');
      }
      throw ApiException('Failed to get mentor response: ${e.message}');
    } catch (e) {
      throw ApiException('Unexpected error: $e');
    }
  }

  // Mentor endpoint (streaming) - TODO: Implement SSE
  Stream<String> postMentorStream(MentorRequest request) async* {
    // TODO: Implement Server-Sent Events streaming
    // For now, fall back to regular request and yield chunks
    try {
      final response = await postMentor(request);
      final words = response.reply.split(' ');
      for (final word in words) {
        yield '$word ';
        await Future.delayed(const Duration(milliseconds: 50)); // Simulate streaming
      }
    } catch (e) {
      yield 'Error: $e';
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

  Future<Map<String, dynamic>> getLesson(String worldId, String lessonId) async {
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