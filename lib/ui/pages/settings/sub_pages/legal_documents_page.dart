import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../../atoms/atoms.dart';

class LegalDocumentsPage extends ConsumerStatefulWidget {
  final String documentType; // 'terms', 'privacy', or 'disclaimer'
  
  const LegalDocumentsPage({
    super.key,
    required this.documentType,
  });

  @override
  ConsumerState<LegalDocumentsPage> createState() => _LegalDocumentsPageState();
}

class _LegalDocumentsPageState extends ConsumerState<LegalDocumentsPage> {
  String _documentContent = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDocument();
  }

  Future<void> _loadDocument() async {
    try {
      String assetPath;
      String title;
      
      switch (widget.documentType) {
        case 'terms':
          assetPath = 'assets/legal/terms.md';
          title = 'Terms of Service';
          break;
        case 'privacy':
          assetPath = 'assets/legal/privacy.md';
          title = 'Privacy Policy';
          break;
        case 'disclaimer':
          assetPath = 'assets/legal/disclaimer.md';
          title = 'Disclaimer & Safety Notice';
          break;
        default:
          assetPath = 'assets/legal/terms.md';
          title = 'Legal Document';
      }

      final content = await rootBundle.loadString(assetPath);
      setState(() {
        _documentContent = content;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _documentContent = 'Error loading document: $e';
        _isLoading = false;
      });
    }
  }

  String _getTitle() {
    switch (widget.documentType) {
      case 'terms':
        return 'Terms of Service';
      case 'privacy':
        return 'Privacy Policy';
      case 'disclaimer':
        return 'Disclaimer & Safety Notice';
      default:
        return 'Legal Document';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WFColors.base,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: WFColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(_getTitle(), style: WFTextStyles.h3),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: WFColors.purple400),
            onPressed: _shareDocument,
          ),
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(WFDims.paddingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Document Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(WFDims.paddingL),
                      decoration: BoxDecoration(
                        gradient: WFGradients.purpleGradient,
                        borderRadius: BorderRadius.circular(WFDims.radiusLarge),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _getDocumentIcon(),
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: WFDims.spacingM),
                          Text(
                            _getTitle(),
                            style: WFTextStyles.h2.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: WFDims.spacingS),
                          Text(
                            'Last updated: January 15, 2025',
                            style: WFTextStyles.bodyMedium.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: WFDims.spacingXL),
                    
                    // Document Content
                    GlassCard(
                      child: Padding(
                        padding: const EdgeInsets.all(WFDims.paddingL),
                        child: _buildMarkdownContent(_documentContent),
                      ),
                    ),
                    
                    const SizedBox(height: WFDims.spacingXL),
                    
                    // Footer Actions
                    _buildFooterActions(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildMarkdownContent(String markdown) {
    // Simple markdown parsing for basic formatting
    final lines = markdown.split('\n');
    final widgets = <Widget>[];
    
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();
      
      if (line.isEmpty) {
        widgets.add(const SizedBox(height: WFDims.spacingM));
        continue;
      }
      
      if (line.startsWith('# ')) {
        // H1
        widgets.add(
          Text(
            line.substring(2),
            style: WFTextStyles.h1.copyWith(color: WFColors.textPrimary),
          ),
        );
      } else if (line.startsWith('## ')) {
        // H2
        widgets.add(
          Text(
            line.substring(3),
            style: WFTextStyles.h2.copyWith(color: WFColors.textPrimary),
          ),
        );
      } else if (line.startsWith('**') && line.endsWith('**')) {
        // Bold text
        widgets.add(
          Text(
            line.substring(2, line.length - 2),
            style: WFTextStyles.bodyLarge.copyWith(
              color: WFColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else if (line.startsWith('- ')) {
        // Bullet point
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: WFDims.spacingM),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: WFTextStyles.bodyMedium.copyWith(color: WFColors.purple400)),
                Expanded(
                  child: Text(
                    line.substring(2),
                    style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textSecondary),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        // Regular text
        widgets.add(
          Text(
            line,
            style: WFTextStyles.bodyMedium.copyWith(color: WFColors.textSecondary),
          ),
        );
      }
      
      if (i < lines.length - 1) {
        widgets.add(const SizedBox(height: WFDims.spacingS));
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _buildFooterActions() {
    return Column(
      children: [
        // Contact Support
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _contactSupport,
            icon: Icon(Icons.support_agent, color: Colors.white),
            label: Text(
              'Contact Support',
              style: WFTextStyles.button.copyWith(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: WFColors.purple400,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(WFDims.radiusMedium),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: WFDims.spacingM),
        
        // Download PDF (placeholder)
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: _downloadPDF,
            icon: Icon(Icons.download, color: WFColors.purple400),
            label: Text(
              'Download PDF',
              style: WFTextStyles.button.copyWith(color: WFColors.purple400),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: WFColors.purple400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(WFDims.radiusMedium),
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _getDocumentIcon() {
    switch (widget.documentType) {
      case 'terms':
        return Icons.description;
      case 'privacy':
        return Icons.privacy_tip;
      case 'disclaimer':
        return Icons.warning;
      default:
        return Icons.description;
    }
  }

  void _shareDocument() {
    // TODO: Implement document sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document sharing coming soon')),
    );
  }

  void _contactSupport() {
    // TODO: Implement contact support
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contact support coming soon')),
    );
  }

  void _downloadPDF() {
    // TODO: Implement PDF download
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('PDF download coming soon')),
    );
  }
} 