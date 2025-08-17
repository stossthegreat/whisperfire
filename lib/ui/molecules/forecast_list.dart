import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class ForecastList extends StatelessWidget {
  final List<ForecastItem> forecasts;

  const ForecastList({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: forecasts.asMap().entries.map((entry) {
        final index = entry.key;
        final forecast = entry.value;
        
        return Padding(
          padding: EdgeInsets.only(
            bottom: index < forecasts.length - 1 ? WFDims.spacingS : 0,
          ),
          child: Row(
            children: [
              Text('📈', style: const TextStyle(fontSize: 14)),
              const SizedBox(width: WFDims.spacingS),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: WFTextStyles.bodyMedium,
                    children: [
                      TextSpan(
                        text: '${forecast.window} — ',
                        style: TextStyle(
                          color: WFColors.purple400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '${forecast.event} ',
                        style: TextStyle(color: WFColors.textSecondary),
                      ),
                      TextSpan(
                        text: '(${forecast.likelihood}%)',
                        style: TextStyle(
                          color: WFColors.textTertiary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ForecastItem {
  final String window;
  final String event;
  final int likelihood;

  const ForecastItem({
    required this.window,
    required this.event,
    required this.likelihood,
  });
} 