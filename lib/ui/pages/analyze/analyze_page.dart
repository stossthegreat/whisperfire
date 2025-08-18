import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../../../data/models/whisperfire_models.dart';
import '../../../data/services/api_service.dart';
import '../../../data/services/cache_service.dart';
import '../../../data/services/whisperfire_services.dart';
import '../../../data/services/constants.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import 'scan_output_card.dart';
import 'pattern_output_card.dart';

// ===== PROVIDERS =====
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
final analyzeResultProvider = StateProvider<WhisperfireResponse?>((ref) => null);
final isAnalyzingProvider = StateProvider<bool>((ref) => false);
final analyzeToneProvider = StateProvider<String>((ref) {
  final settings = CacheService.getSettings();
  return settings.defaultTone;
});
final analyzeModeProvider = StateProvider<String>((ref) {
  final settings = CacheService.getSettings();
  return settings.defaultAnalyzeMode;
});

class AnalyzePage extends ConsumerStatefulWidget {
  const AnalyzePage({super.key});

  @override
  ConsumerState<AnalyzePage> createState() => _AnalyzePageState();
}

class _AnalyzePageState extends ConsumerState<AnalyzePage> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() {
    final settings = CacheService.getSettings();
    ref.read(analyzeToneProvider.notifier).state = settings.defaultTone;
    ref.read(analyzeModeProvider.notifier).state = settings.defaultAnalyzeMode;
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTone = ref.watch(analyzeToneProvider);
    final selectedMode = ref.watch(analyzeModeProvider);
    final isAnalyzing = ref.watch(isAnalyzingProvider);
    final result = ref.watch(analyzeResultProvider);

    return Scaffold(
      backgroundColor: WFColors.base,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(WFDims.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: WFGradients.purpleGradient,
                        borderRadius: BorderRadius.circular(WFDims.radiusXLarge),
                        boxShadow: WFShadows.purpleGlow,
                      ),
                      child: Icon(
                        Icons.visibility,
                        size: 40,
                        color: WFColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: WFDims.spacingL),
                    Text('ANALYZE', style: WFTextStyles.h1),
                    const SizedBox(height: WFDims.spacingS),
                    Text(
                      'Scan messages for manipulation patterns',
                      style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textTertiary),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingXXL),
              
              // Controls
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tone selector (Brutal | Soft | Clinical → maps to savage|soft|clinical)
                    Text('Tone', style: WFTextStyles.h4),
                    const SizedBox(height: WFDims.spacingS),
                    Row(
                      children: [
                        _toneButton('brutal', 'Brutal', selectedTone),
                        const SizedBox(width: WFDims.spacingS),
                        _toneButton('soft', 'Soft', selectedTone),
                        const SizedBox(width: WFDims.spacingS),
                        _toneButton('clinical', 'Clinical', selectedTone),
                      ],
                    ),
                    
                    const SizedBox(height: WFDims.spacingL),
                    
                    // Mode selector & OCR
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mode', style: WFTextStyles.h4),
                              const SizedBox(height: WFDims.spacingS),
                              Row(
                                children: [
                                  _modeButton('scan', 'Scan', selectedMode),
                                  const SizedBox(width: WFDims.spacingS),
                                  _modeButton('pattern', 'Pattern', selectedMode),
                                ],
                              ),
                            ],
                          ),
                        ),
                        WFIconButton(
                          icon: Icons.camera_alt,
                          onPressed: () {
                            _showOCRModal(context);
                          },
                          tooltip: 'OCR (Tesseract)',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Input
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedMode == 'scan' ? 'Message to analyze' : 'Messages (one per line)',
                      style: WFTextStyles.h4,
                    ),
                    const SizedBox(height: WFDims.spacingS),
                    if (selectedMode == 'pattern')
                      Text(
                        'One message per line.',
                        style: WFTextStyles.bodySmall.copyWith(color: WFColors.textTertiary),
                      ),
                    const SizedBox(height: WFDims.spacingS),
                    TextField(
                      controller: _textController,
                      maxLines: selectedMode == 'scan' ? 6 : 8,
                      style: WFTextStyles.bodyMedium,
                      decoration: InputDecoration(
                        hintText: selectedMode == 'scan' 
                          ? 'Paste the message you want to analyze...'
                          : 'Message 1\nMessage 2\nMessage 3...',
                        hintStyle: WFTextStyles.bodyMedium.copyWith(color: WFColors.textMuted),
                        filled: true,
                        fillColor: WFColors.gray800.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                          borderSide: BorderSide(color: WFColors.glassBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                          borderSide: BorderSide(color: WFColors.glassBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(WFDims.radiusMedium),
                          borderSide: BorderSide(color: WFColors.purple400, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Analyze button
              SizedBox(
                width: double.infinity,
                child: WFPrimaryButton(
                  text: 'Analyze',
                  icon: Icons.visibility,
                  isLoading: isAnalyzing,
                  onPressed: _textController.text.trim().isEmpty ? null : () => _analyze(ref),
                ),
              ),
              
              const SizedBox(height: WFDims.spacingL),
              
              // Results area
              if (isAnalyzing)
                const SkeletonCard(height: 400)
              else if (result != null)
                _buildResultCard(result, selectedMode)
              else
                GlassCard(
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.search,
                          size: 48,
                          color: WFColors.textMuted,
                        ),
                        const SizedBox(height: WFDims.spacingM),
                        Text(
                          'Results will appear here',
                          style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                ),
              
              const SizedBox(height: WFDims.spacingXXL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toneButton(String value, String label, String selectedTone) {
    final isSelected = selectedTone == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => ref.read(analyzeToneProvider.notifier).state = value,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: WFDims.paddingS),
          decoration: BoxDecoration(
            color: isSelected ? WFColors.purple500.withOpacity(0.2) : WFColors.gray800.withOpacity(0.3),
            borderRadius: BorderRadius.circular(WFDims.radiusSmall),
            border: Border.all(
              color: isSelected ? WFColors.purple400 : WFColors.gray600,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: WFTextStyles.labelMedium.copyWith(
              color: isSelected ? WFColors.purple300 : WFColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _modeButton(String value, String label, String selectedMode) {
    final isSelected = selectedMode == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => ref.read(analyzeModeProvider.notifier).state = value,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: WFDims.paddingS),
          decoration: BoxDecoration(
            color: isSelected ? WFColors.purple500.withOpacity(0.2) : WFColors.gray800.withOpacity(0.3),
            borderRadius: BorderRadius.circular(WFDims.radiusSmall),
            border: Border.all(
              color: isSelected ? WFColors.purple400 : WFColors.gray600,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: WFTextStyles.labelMedium.copyWith(
              color: isSelected ? WFColors.purple300 : WFColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  void _showOCRModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: WFColors.gray900,
        title: Text('OCR (Tesseract)', style: WFTextStyles.h3),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'OCR functionality will be available soon. Upload an image to extract text automatically.',
              style: WFTextStyles.bodyMedium,
            ),
            const SizedBox(height: WFDims.spacingL),
            WFPrimaryButton(
              text: 'Upload Image',
              icon: Icons.upload,
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement OCR
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close', style: WFTextStyles.button.copyWith(color: WFColors.purple400)),
          ),
        ],
      ),
    );
  }

  Future<void> _analyze(WidgetRef ref) async {
    final selectedTone = ref.read(analyzeToneProvider);
    final selectedMode = ref.read(analyzeModeProvider);
    
    ref.read(isAnalyzingProvider.notifier).state = true;
    ref.read(analyzeResultProvider.notifier).state = null;

    try {
      final apiService = ref.read(apiServiceProvider);
      
      // Build request payload (exact bodies)
      final Map<String, dynamic> requestBody;
      
      if (selectedMode == 'scan') {
        requestBody = WhisperfireServices.buildRequestPayload(
          tab: 'scan',
          relationship: 'Partner', // Default
          tone: selectedTone,
          contentType: 'dm', // Default
          subjectName: null,
          message: _textController.text.trim(),
        );
      } else {
        // Pattern mode - split by lines
        final messages = _textController.text
            .split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .toList();
            
        requestBody = WhisperfireServices.buildRequestPayload(
          tab: 'pattern',
          relationship: 'Partner', // Default
          tone: selectedTone,
          contentType: 'dm', // Default
          subjectName: null,
          messages: messages,
        );
      }

      // Make API call
      WhisperfireResponse response;
      if (false) {
        response = await _getMockResponse(selectedMode, selectedTone);
      } else {
        response = await apiService.postAnalyzeWhisperfire(requestBody);
      }

      // Enforce client guards (clamp metrics, trim receipts, dedup reply lines)
      final guardedResponse = WhisperfireServices.enforceClientGuards(response);

      ref.read(analyzeResultProvider.notifier).state = guardedResponse;

      // Save to history if enabled
      final settings = CacheService.getSettings();
      if (settings.saveHistory) {
        await CacheService.saveAnalysisHistory(
          DateTime.now().millisecondsSinceEpoch.toString(),
          {
            'mode': selectedMode,
            'tone': selectedTone,
            'input': _textController.text,
            'result': guardedResponse.toJson(),
          },
        );
      }

      // Scroll to results
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      });

    } catch (e) {
      // Show error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Analysis failed: $e', style: WFTextStyles.bodySmall),
            backgroundColor: WFColors.redPink[0],
          ),
        );
      }
    } finally {
      ref.read(isAnalyzingProvider.notifier).state = false;
    }
  }

  Widget _buildResultCard(WhisperfireResponse result, String mode) {
    if (mode == 'scan') {
      return ScanOutputCard(result: result);
    } else {
      return PatternOutputCard(result: result);
    }
  }

  // Mock response for development
  Future<WhisperfireResponse> _getMockResponse(String mode, String tone) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate API delay
    
    if (mode == 'scan') {
      return MockData.mockScanResponse;
    } else {
      return MockData.mockPatternResponse;
    }
  }
}