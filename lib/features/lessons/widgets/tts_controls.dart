import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsControls extends StatefulWidget {
  final String text;
  final double width;

  const TtsControls({
    super.key,
    required this.text,
    this.width = 300,
  });

  @override
  State<TtsControls> createState() => _TtsControlsState();
}

class _TtsControlsState extends State<TtsControls>
    with TickerProviderStateMixin {
  late FlutterTts _tts;
  bool _isPlaying = false;
  bool _isPaused = false;
  late AnimationController _waveformController;
  late List<AnimationController> _barControllers;

  @override
  void initState() {
    super.initState();
    _initTts();
    _initAnimations();
  }

  void _initTts() async {
    _tts = FlutterTts();
    await _tts.setLanguage('en-GB');
    await _tts.setPitch(1.05);
    await _tts.setSpeechRate(0.44);

    _tts.setCompletionHandler(() {
      setState(() {
        _isPlaying = false;
        _isPaused = false;
      });
      _stopWaveform();
    });

    _tts.setErrorHandler((msg) {
      setState(() {
        _isPlaying = false;
        _isPaused = false;
      });
      _stopWaveform();
    });
  }

  void _initAnimations() {
    _waveformController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _barControllers = List.generate(
        5,
        (index) => AnimationController(
              duration: Duration(milliseconds: 800 + (index * 200)),
              vsync: this,
            ));
  }

  void _startWaveform() {
    _waveformController.repeat();
    for (final controller in _barControllers) {
      controller.repeat();
    }
  }

  void _stopWaveform() {
    _waveformController.stop();
    for (final controller in _barControllers) {
      controller.stop();
    }
  }

  Future<void> _play() async {
    if (_isPaused) {
      // For pause/resume, we'll just restart since FlutterTts doesn't have resume
      await _tts.speak(widget.text);
      setState(() {
        _isPlaying = true;
        _isPaused = false;
      });
      _startWaveform();
    } else {
      await _tts.speak(widget.text);
      setState(() {
        _isPlaying = true;
        _isPaused = false;
      });
      _startWaveform();
    }
  }

  Future<void> _pause() async {
    await _tts.pause();
    setState(() {
      _isPlaying = false;
      _isPaused = true;
    });
    _stopWaveform();
  }

  Future<void> _stop() async {
    await _tts.stop();
    setState(() {
      _isPlaying = false;
      _isPaused = false;
    });
    _stopWaveform();
  }

  @override
  void dispose() {
    _tts.stop();
    _waveformController.dispose();
    for (final controller in _barControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Waveform visualization
          if (_isPlaying) ...[
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return AnimatedBuilder(
                    animation: _barControllers[index],
                    builder: (context, child) {
                      final height =
                          8.0 + (_barControllers[index].value * 32.0);
                      return Container(
                        width: 4,
                        height: height,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.purple[400],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Control buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildControlButton(
                icon: Icons.play_arrow,
                onPressed: _isPlaying ? null : _play,
                color: Colors.green,
              ),
              _buildControlButton(
                icon: Icons.pause,
                onPressed: _isPlaying ? _pause : null,
                color: Colors.orange,
              ),
              _buildControlButton(
                icon: Icons.stop,
                onPressed: (_isPlaying || _isPaused) ? _stop : null,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback? onPressed,
    required Color color,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: onPressed != null ? color : Colors.grey[300],
        borderRadius: BorderRadius.circular(24),
        boxShadow: onPressed != null
            ? [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
