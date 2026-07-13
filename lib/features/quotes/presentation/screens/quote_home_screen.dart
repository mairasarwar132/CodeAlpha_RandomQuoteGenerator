import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/theme_mode_provider.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/primary_action_button.dart';
import '../providers/quote_providers.dart';
import '../widgets/quote_card.dart';

class QuoteHomeScreen extends ConsumerWidget {
  const QuoteHomeScreen({super.key});

  static const String routeName = 'home';
  static const String routePath = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.watch(quoteControllerProvider);
    final controller = ref.read(quoteControllerProvider.notifier);
    final themeMode = ref.watch(themeModeProvider);
    final isCompact = ResponsiveLayout.isCompact(context);
    final isWide = MediaQuery.sizeOf(context).width >= 940;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode =
        themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            platformBrightness == Brightness.dark);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 52,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
            child: IconButton(
              tooltip: isDarkMode ? 'Use light theme' : 'Use dark theme',
              onPressed: () {
                ref.read(themeModeProvider.notifier).toggle(platformBrightness);
              },
              icon: Icon(
                isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              ),
            ),
          ),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: ResponsiveLayout.pagePadding(context),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppConstants.maxContentWidth,
                ),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(
                    vertical: isWide ? AppSpacing.xl : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _Header(isCompact: isCompact),
                      SizedBox(
                        height: isCompact ? AppSpacing.lg : AppSpacing.xl,
                      ),
                      QuoteCard(quote: quote),
                      const SizedBox(height: AppSpacing.md),
                      _Actions(
                        totalQuotes: controller.totalQuotes,
                        onNewQuote: controller.generateNewQuote,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppLogo(size: 52),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.appName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge?.copyWith(letterSpacing: 0.1),
                  ),
                  Text(
                    'Local inspiration library',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: isCompact ? AppSpacing.md : AppSpacing.lg),
        Text(
          AppConstants.appTagline,
          style:
              (isCompact ? textTheme.headlineMedium : textTheme.headlineLarge)
                  ?.copyWith(letterSpacing: 0.1),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Refresh your perspective with a carefully curated quote whenever you need a spark.',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({required this.totalQuotes, required this.onNewQuote});

  final int totalQuotes;
  final VoidCallback onNewQuote;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        Semantics(
          label: '$totalQuotes local quotes available',
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.58,
              ),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.62),
              ),
            ),
            child: Text(
              '$totalQuotes curated local quotes',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        PrimaryActionButton(
          label: 'New Quote',
          icon: Icons.auto_awesome_rounded,
          onPressed: onNewQuote,
        ),
      ],
    );
  }
}
