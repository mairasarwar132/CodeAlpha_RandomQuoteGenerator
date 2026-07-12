import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({this.size = 52, this.elevation = 14, super.key});

  final double size;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = size * 0.32;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.28),
            blurRadius: elevation,
            offset: Offset(0, elevation * 0.42),
          ),
        ],
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary,
              colorScheme.tertiary,
              colorScheme.secondary,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size * 0.16,
              right: size * 0.18,
              child: Container(
                width: size * 0.16,
                height: size * 0.16,
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withValues(alpha: 0.82),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Icon(
              Icons.format_quote_rounded,
              size: size * 0.56,
              color: colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
