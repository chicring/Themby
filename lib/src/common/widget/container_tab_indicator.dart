import 'package:flutter/material.dart';

/// A customizable [Decoration] which can define
/// the appearance of the selected tab indicator.
class ContainerTabIndicator extends Decoration {
  const ContainerTabIndicator({
    this.width,
    this.widthFraction,
    this.height,
    this.heightFraction,
    this.padding = const EdgeInsets.all(0.0),
    this.color = const Color(0xFF2196F3),
    this.radius = BorderRadius.zero,
    this.borderWidth = 0.0,
    this.borderColor = const Color(0xFF2196F3),
  });

  /// The width of the tab indicator.
  ///
  /// If not provided, it uses all the available width.
  final double? width;

  /// Multiplies the available width,
  /// e.g. if set to 0.5 it uses half of the available width.
  ///
  /// If this is set, [width] will be ignored.
  final double? widthFraction;

  /// The height of the tab indicator.
  ///
  /// If not provided, it uses all the available height.
  final double? height;

  /// Multiplies the available height,
  /// e.g. if set to 0.5 it uses half of the available height.
  ///
  /// If this is set, [height] will be ignored.
  final double? heightFraction;

  /// The padding of the tab indicator.
  @override
  final EdgeInsetsGeometry padding;

  /// The background color of the tab indicator.
  final Color color;

  /// The border radius of the tab indicator.
  final BorderRadius radius;

  /// The border width of the tab indicator.
  final double borderWidth;

  /// The border color of the tab indicator.
  final Color borderColor;

  @override
  _ContainerTabPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ContainerTabPainter(
      onChanged,
      indicator: this,
    );
  }
}

class _ContainerTabPainter extends BoxPainter {
  _ContainerTabPainter(
      VoidCallback? onChanged, {
        this.indicator = const ContainerTabIndicator(),
      }) : super(onChanged) {
    resolvedPadding = indicator.padding.resolve(TextDirection.rtl);
  }

  final ContainerTabIndicator indicator;
  late EdgeInsets resolvedPadding;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    double width;
    double height;

    assert(configuration.size != null); // todo ?!

    if (indicator.widthFraction != null) {
      width = (indicator.widthFraction! * configuration.size!.width)
          .clamp(0, configuration.size!.width);
    } else {
      width = indicator.width ?? configuration.size!.width;
    }
    if (indicator.heightFraction != null) {
      height = (indicator.heightFraction! * configuration.size!.height)
          .clamp(0, configuration.size!.height);
    } else {
      height = indicator.height ?? configuration.size!.height;
    }

    if (indicator.padding.horizontal > (configuration.size!.width - width)) {
      width -= indicator.padding.horizontal;
    }
    if (indicator.padding.vertical > (configuration.size!.height - height)) {
      height -= indicator.padding.vertical;
    }

    Offset finalOffset = Offset(
      offset.dx + resolvedPadding.left - resolvedPadding.right,
      offset.dy + resolvedPadding.top - resolvedPadding.bottom,
    );

    if (indicator.borderWidth > 0.0) {
      final RRect borderRRect = _buildRRect(
        finalOffset,
        configuration,
        width - indicator.borderWidth,
        height - indicator.borderWidth,
      );
      final Paint paint = Paint()
        ..color = indicator.borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = indicator.borderWidth;
      canvas.drawRRect(borderRRect, paint);

      width -= 2 * indicator.borderWidth;
      height -= 2 * indicator.borderWidth;
    }

    final RRect indicatorRRect = _buildRRect(
      finalOffset,
      configuration,
      width,
      height,
    );
    final Paint paint = Paint()
      ..color = indicator.color
      ..style = PaintingStyle.fill;
    canvas.drawRRect(indicatorRRect, paint);
  }

  RRect _buildRRect(
      Offset offset,
      ImageConfiguration configuration,
      double width,
      double height,
      ) {
    return RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(offset.dx + configuration.size!.width / 2,
            offset.dy + configuration.size!.height / 2),
        width: width,
        height: height,
      ),
      topLeft: indicator.radius.topLeft,
      topRight: indicator.radius.topRight,
      bottomRight: indicator.radius.bottomRight,
      bottomLeft: indicator.radius.bottomLeft,
    );
  }
}