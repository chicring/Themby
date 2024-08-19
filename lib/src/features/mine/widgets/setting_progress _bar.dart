import 'package:flutter/material.dart';

class SettingProgressBar extends StatefulWidget {
  const SettingProgressBar({super.key, required this.value, required this.onChange, required this.title, required this.min, required this.max, required this.divisions});

  final String title;
  final int value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<int> onChange;

  @override
  State<SettingProgressBar> createState() => _SettingProgressBarState();
}

class _SettingProgressBarState extends State<SettingProgressBar> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.value.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    Color titleColor = Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: const SliderThemeData(
                    thumbShape: CustomThumbShape(),
                    trackHeight: 10,
                  ),
                  child: Slider(
                    label: _sliderValue.toInt().toString(),
                    min: widget.min,
                    max: widget.max,
                    value: _sliderValue,
                    divisions: widget.divisions,
                    onChanged: (value) {
                      setState(() {
                        widget.onChange(value.toInt());
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
              ),
              Text(_sliderValue.toInt().toString())
            ],
          )
        ],
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;

  const CustomThumbShape({this.thumbWidth = 8.0, this.thumbHeight = 30.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    final RRect thumbRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: center,
        width: thumbWidth,
        height: thumbHeight,
      ),
      const Radius.circular(4.0), // Adjust the radius for rounded corners
    );

    canvas.drawRRect(thumbRRect, paint);
  }
}