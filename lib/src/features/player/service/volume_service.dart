

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'volume_service.g.dart';


class VolumeInfo{
  final double volume;
  final bool showToast;

  const VolumeInfo({required this.volume, required this.showToast});
}


@riverpod
class VolumeService extends _$VolumeService{

  @override
  VolumeInfo build() => const VolumeInfo(volume: 0.5, showToast: false);

  void showVolumeToast(){
    state = VolumeInfo(volume: state.volume, showToast: true);
  }

  void update(double volume){
    state = VolumeInfo(volume: volume, showToast: state.showToast);
  }

  void closeVolumeToast(){
    state = VolumeInfo(volume: state.volume, showToast: false);
  }
}