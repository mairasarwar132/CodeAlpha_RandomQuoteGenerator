import 'package:flutter/material.dart';

class PrimaryActionButton extends StatefulWidget {
  const PrimaryActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  State<PrimaryActionButton> createState() => _PrimaryActionButtonState();
}

class _PrimaryActionButtonState extends State<PrimaryActionButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final offset = _isHovered ? const Offset(0, 12) : const Offset(0, 8);
    final blur = _isHovered ? 26.0 : 18.0;

    return AnimatedScale(
      scale: _isPressed ? 0.97 : 1,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOutCubic,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.26),
              blurRadius: blur,
              offset: offset,
            ),
          ],
        ),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Listener(
            onPointerDown: (_) => setState(() => _isPressed = true),
            onPointerUp: (_) => setState(() => _isPressed = false),
            onPointerCancel: (_) => setState(() => _isPressed = false),
            child: FilledButton.icon(
              onPressed: widget.onPressed,
              icon: Icon(widget.icon, size: 20),
              label: Text(widget.label),
            ),
          ),
        ),
      ),
    );
  }
}
