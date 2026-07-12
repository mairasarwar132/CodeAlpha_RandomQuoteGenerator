import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return ColoredBox(
      color: colorScheme.surface,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  isDark ? const Color(0xFF101924) : const Color(0xFFFFF3E6),
                  colorScheme.surface,
                  isDark ? const Color(0xFF161326) : const Color(0xFFEAF7F3),
                ],
                stops: const [0, 0.48, 1],
              ),
            ),
          ),
          Positioned(
            top: -96,
            left: -72,
            child: _SoftCircle(
              size: 240,
              color: colorScheme.primary.withValues(
                alpha: isDark ? 0.18 : 0.16,
              ),
            ),
          ),
          Positioned(
            right: -112,
            bottom: -104,
            child: _SoftCircle(
              size: 300,
              color: colorScheme.secondary.withValues(
                alpha: isDark ? 0.14 : 0.13,
              ),
            ),
          ),
          Positioned(
            right: 42,
            top: 112,
            child: _SoftCircle(
              size: 112,
              color: colorScheme.tertiary.withValues(
                alpha: isDark ? 0.12 : 0.10,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  const _SoftCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}
