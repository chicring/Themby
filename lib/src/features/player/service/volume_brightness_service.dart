

import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/player/service/lock_service.dart';

part 'volume_brightness_service.g.dart';

class VolumeBrightnessInfo{

  final bool isVolumeDrag;

  final bool isBrightnessDrag;

  final double volume;

  final double brightness;

  final bool showToast;

  final Offset startPanOffset;

  final double movePan;

  const VolumeBrightnessInfo({
    this.isBrightnessDrag = false,
    this.isVolumeDrag = false,
    this.startPanOffset = const Offset(0, 0),
    this.movePan = 0,
    required this.volume,
    required this.brightness,
    required this.showToast
  });

  VolumeBrightnessInfo copyWith({
    bool? isVolumeDrag,
    bool? isBrightnessDrag,
    double? volume,
    double? brightness,
    bool? showToast,
    Offset? startPanOffset,
    double? movePan
  }){
    return VolumeBrightnessInfo(
        isVolumeDrag: isVolumeDrag ?? this.isVolumeDrag,
        isBrightnessDrag: isBrightnessDrag ?? this.isBrightnessDrag,
        volume: volume ?? this.volume,
        brightness: brightness ?? this.brightness,
        showToast: showToast ?? this.showToast,
        startPanOffset: startPanOffset ?? this.startPanOffset,
        movePan: movePan ?? this.movePan
    );
  }
}

@riverpod
class VolumeBrightnessService extends _$VolumeBrightnessService{


  @override
  VolumeBrightnessInfo build() => const VolumeBrightnessInfo(volume: 0.0, showToast: false, brightness: 0.0);

  Future<void> update() async {
    FlutterVolumeController.getVolume().then((v){
      state = state.copyWith(volume: v);
    });
  }

  Future<void> onVerticalDragStart(DragStartDetails details, double width) async{
    final lock = ref.read(lockServiceProvider).controlsLock;
    if(lock) return;
    _resetPan();
    state =state.copyWith(startPanOffset: details.globalPosition);
    if(state.startPanOffset.dx < width * 0.5){
      state = state.copyWith(isBrightnessDrag: true);
    }else{
      state = state.copyWith(isVolumeDrag: true);
      // state = state.copyWith(isVolumeDrag: true);
    }
  }

  void onVerticalDragUpdate(DragUpdateDetails details, double height){
    final lock = ref.read(lockServiceProvider).controlsLock;
    if(lock) return;
    double movePan = state.movePan;
    state = state.copyWith(movePan: movePan += (-details.delta.dy));
    if(state.isBrightnessDrag) {
      double b = _getBrightnessValue(height);
      // 更新亮度，显示亮度提示
    }else{
      // final double level = height;
      // final double volume =
      // FlutterVolumeController.updateShowSystemUI(false);
      // FlutterVolumeController.setVolume(v);
      // FlutterVolumeController.getVolume().then((v){
      //   print(v);
      // });
      // FlutterVolumeController.getVolume();
    }
  }

  void onVerticalDragEnd(_){
    final lock = ref.read(lockServiceProvider).controlsLock;
    if(lock) return;
  }

  // 重置手势
  void _resetPan(){
    state = state.copyWith(
      isBrightnessDrag: false,
      isVolumeDrag: false,
      movePan: 0,
      startPanOffset: const Offset(0, 0)
    );
  }

  // 计算亮度百分比
  double _getBrightnessValue(double height){
    double value = double.parse((state.movePan / height + state.brightness).toStringAsFixed(2));
    if (value >= 1.00) {
      value = 1.00;
    } else if (value <= 0.00) {
      value = 0.00;
    }
    return value;
  }

  double _getVolumeValue(double height) {
    double value = double.parse((state.movePan / height + state.volume).toStringAsFixed(2));
    if (value >= 1.0) {
      value = 1.0;
    } else if (value <= 0.0) {
      value = 0.0;
    }
    return value;
  }
}

