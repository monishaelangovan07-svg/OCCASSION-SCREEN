import 'package:flutter/material.dart';

/// Wraps [child] and gives it a light "pop up" lift — a subtle scale-up
/// plus a soft shadow — when the cursor hovers over it (desktop/web) or
/// it is pressed (touch devices).
class HoverPop extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double hoverScale;
  final BorderRadius? borderRadius;

  /// When false, only the hover (mouse) lift is applied — no
  /// [Listener]/[GestureDetector] is added, so the card's own buttons keep
  /// receiving taps normally.
  final bool enableTapFeedback;

  const HoverPop({
    super.key,
    required this.child,
    this.onTap,
    this.hoverScale = 1.06,
    this.borderRadius,
    this.enableTapFeedback = true,
  });

  @override
  State<HoverPop> createState() => _HoverPopState();
}

class _HoverPopState extends State<HoverPop> {
  bool _active = false;

  void _setActive(bool value) {
    if (_active != value) setState(() => _active = value);
  }

  Future<void> _handleTap() async {
    if (widget.onTap == null) return;
    // Let the pop animation become visible before navigating away.
    _setActive(true);
    await Future.delayed(const Duration(milliseconds: 120));
    if (!mounted) return;
    widget.onTap!();
    await Future.delayed(const Duration(milliseconds: 80));
    if (!mounted) return;
    _setActive(false);
  }

  @override
  Widget build(BuildContext context) {
    Widget animated = AnimatedScale(
      scale: _active ? widget.hoverScale : 1.0,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          boxShadow: _active
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: widget.child,
      ),
    );

    if (widget.enableTapFeedback) {
      animated = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handleTap,
        onTapDown: (_) => _setActive(true),
        onTapCancel: () => _setActive(false),
        child: animated,
      );
    }

    return MouseRegion(
      cursor: widget.enableTapFeedback
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => _setActive(true),
      onExit: (_) => _setActive(false),
      child: animated,
    );
  }
}
