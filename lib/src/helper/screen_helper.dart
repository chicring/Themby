


import 'package:flutter/material.dart';

/*
* 将屏幕按宽度分成24份，根据不同的断点返回不同的份数
 */

extension ScreenExtension on int {
  double get pw => ScreenHelper.getInstance().getWidthPortion(this);
}

class ScreenHelper {

  static double screenWidth = 0;
  static double screenHeight = 0;
  MediaQueryData? _mediaQueryData;
  List<double> _widthPortion = [];
  static final ScreenHelper _instance = ScreenHelper();

  static ScreenHelper getInstance(){
    if (_instance._mediaQueryData == null) {
      _instance._init();
    }
    return _instance;
  }

  _init(){
    MediaQueryData mediaQuery = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);

    if(mediaQuery != _mediaQueryData){
      _mediaQueryData = mediaQuery;

      if(mediaQuery.size.width / mediaQuery.size.height < 1.0){
        screenWidth = mediaQuery.size.width;
        screenHeight = mediaQuery.size.height;
      } else {
        screenWidth = mediaQuery.size.height;
        screenHeight = mediaQuery.size.width;
      }

      double basePortion = screenWidth / 12;
      _widthPortion = [
        basePortion,
        basePortion * 2,
        basePortion * 3,
        basePortion * 4,
        basePortion * 5,
        basePortion * 6,
        basePortion * 7,
        basePortion * 8,
        basePortion * 9,
        basePortion * 10,
        basePortion * 11,
        basePortion * 12,
      ];
    }
  }


  double getWidthPortion(int portion){
    if(portion >= 1 && portion < 12){
      return _widthPortion[portion - 1];
    }else{
      return screenWidth / 12 * portion;
    }
  }

  static double getPortionAuto({int xs = 3, int sm = 2, int md = 1, int? custom}){
    if(screenWidth < 650){
      return xs.pw;
    }else if(screenWidth >= 650 && screenWidth < 1000){
      return sm.pw;
    }else if(screenWidth >= 1000 && screenWidth < 1200){
      return md.pw;
    }else{
      return screenWidth;
    }
  }

  static double getTextContextSizeHeight(String text,double fontSize,FontWeight fontWeight,double height,double maxWidth,int maxLines){
    TextPainter textPainter = TextPainter(
      //用于选择用户的语言和格式首选项的标识符。
        locale: WidgetsBinding.instance.window.locale,
        //最大行数
        maxLines: maxLines,
        //文本书写方向l to r 汉字从左到右
        textDirection: TextDirection.ltr,
        //文本内容以及文本样式 style:可以根据在代码中设置的TextStyle增加字段。
        text: TextSpan(
            text: text,
            style: TextStyle(
              fontWeight:fontWeight,//字重
              fontSize: fontSize ,//字体大小
              height: height,//行高
            )
        )
    );
    //最大宽度
    textPainter.layout(maxWidth: maxWidth);
    //返回高度
    return textPainter.height;
  }
}