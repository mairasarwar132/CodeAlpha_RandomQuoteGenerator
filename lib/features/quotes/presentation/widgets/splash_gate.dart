import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/app_logo.dart';

class SplashGate extends StatefulWidget {
  const SplashGate({required this.child, super.key});

  final Widget child;

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.82, curve: Curves.easeOutCubic),
      reverseCurve: Curves.easeInCubic,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.94,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        IgnorePointer(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final progress = _controller.value;
              final opacity = progress < 0.72
                  ? 1.0
                  : (1.0 - ((progress - 0.72) / 0.28)).clamp(0.0, 1.0);

              return Opacity(opacity: opacity, child: child);
            },
            child: const _SplashContent(),
          ),
        ),
      ],
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_SplashGateState>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AppBackground(
      child: Center(
        child: FadeTransition(
          opacity: state!._fadeAnimation,
          child: ScaleTransition(
            scale: state._scaleAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLogo(size: 86, elevation: 24),
                const SizedBox(height: AppSpacing.lg),
                Text(AppConstants.appName, style: textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Inspiration, one thought at a time.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
