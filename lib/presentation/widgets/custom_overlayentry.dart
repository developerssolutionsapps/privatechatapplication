import 'package:flutter/material.dart';

class CustomOverlayEntry {
  static final instance = CustomOverlayEntry._();
  CustomOverlayEntry._();

  OverlayEntry? _overlayEntry;

  /// Creates an overlay entry.
  ///
  /// [child] is children of stack
  /// Call [hideOverlay] to close
  void showOverlay(BuildContext context,
      {required Widget child, bool withOpacity = true}) {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
                child: GestureDetector(
              onTap: hideOverlay,
              child: Material(
                  color: Colors.black.withOpacity(!withOpacity ? 0.9 : 0.3)),
            )),
            child
          ],
        ),
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void loadingCircularProgressIndicator(BuildContext context) {
    showOverlay(context,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.green,
            color: Colors.green,
            strokeWidth: 6,
            // strokeCap: StrokeCap.round,
          ),
        ));
  }
}
