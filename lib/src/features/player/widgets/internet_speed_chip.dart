
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_speed_meter/internet_speed_meter.dart';

class InternetSpeedChip extends StatefulWidget{
  const InternetSpeedChip({super.key});

  @override
  State<StatefulWidget> createState() => _InternetSpeedChip();
}

class _InternetSpeedChip extends State<InternetSpeedChip>{

  late String _currentSpeed;

  final InternetSpeedMeter _internetSpeedMeterPlugin = InternetSpeedMeter();

  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _currentSpeed = '';
    init();
  }

  void init() async {

    _subscription = _internetSpeedMeterPlugin.getCurrentInternetSpeed().listen((event) {
      setState(() {
        _currentSpeed = event;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xAA333333),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.swap_vert, color: Colors.white, size: 14),
          const SizedBox(width: 2),
          Text(_currentSpeed, style: const TextStyle(color: Colors.white, fontSize: 11),),
        ],
      ),
    );
  }
}