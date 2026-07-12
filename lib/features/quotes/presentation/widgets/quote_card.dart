import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({required this.quote, super.key});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Semantics(
      label: 'Quote by ${quote.author}',
      liveRegion: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: isDark ? 0.34 : 0.13),
              blurRadius: 38,
              offset: const Offset(0, 22),
            ),
            BoxShadow(
              color: colorScheme.primary.withValues(
                alpha: isDark ? 0.10 : 0.08,
              ),
              blurRadius: 60,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Card(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isNarrow = constraints.maxWidth < 380;
                  final padding = EdgeInsets.all(
                    isNarrow ? AppSpacing.lg : AppSpacing.xl,
                  );

                  return Container(
                    width: double.infinity,
                    padding: padding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.surfaceContainerHighest.withValues(
                            alpha: isDark ? 0.68 : 0.78,
                          ),
                          colorScheme.surface.withValues(
                            alpha: isDark ? 0.58 : 0.70,
                          ),
                        ],
                      ),
                      border: Border.all(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: isDark ? 0.34 : 0.62,
                        ),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: AppConstants.quoteTransitionDuration,
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      transitionBuilder: (child, animation) {
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCubic,
                          reverseCurve: Curves.easeInCubic,
                        );
                        final scaleAnimation = Tween<double>(
                          begin: 0.96,
                          end: 1,
                        ).animate(curvedAnimation);
                        final slideAnimation = Tween<Offset>(
                          begin: const Offset(0, 0.04),
                          end: Offset.zero,
                        ).animate(curvedAnimation);

                        return FadeTransition(
                          opacity: curvedAnimation,
                          child: SlideTransition(
                            position: slideAnimation,
                            child: ScaleTransition(
                              scale: scaleAnimation,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        key: ValueKey<String>(quote.text),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _QuoteIcon(colorScheme: colorScheme),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            quote.text,
                            style: textTheme.headlineMedium?.copyWith(
                              height: 1.32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Divider(
                            color: colorScheme.outlineVariant.withValues(
                              alpha: 0.72,
                            ),
                            thickness: 1,
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              '- ${quote.author}',
                              maxLines: null,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.end,
                              softWrap: true,
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.w800,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuoteIcon extends StatelessWidget {
  const _QuoteIcon({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.18)),
      ),
      child: Icon(
        Icons.format_quote_rounded,
        size: 36,
        color: colorScheme.primary,
      ),
    );
  }
}
