

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'fit_type_service.g.dart';

const List<Map<String, dynamic>> videoFitType = [
  {'attr': BoxFit.contain, 'desc': '包含'},
  {'attr': BoxFit.cover, 'desc': '覆盖'},
  {'attr': BoxFit.fill, 'desc': '填充'},
  {'attr': BoxFit.fitHeight, 'desc': '高度适应'},
  {'attr': BoxFit.fitWidth, 'desc': '宽度适应'},
  {'attr': BoxFit.scaleDown, 'desc': '缩小适应'},
];


@riverpod
class FitTypeService extends _$FitTypeService{

  @override
  int build() => 0;

  Future<void> toggleFitType() async {
    final length = videoFitType.length;
    int fitType = state;
    if (state == length - 1) {
      fitType = 0;
    } else {
      fitType = state + 1;
    }
    state = fitType;
  }
}