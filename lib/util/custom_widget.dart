import 'package:flutter/material.dart';
import 'package:shengyu_weather_forecast/util/local_and_net_image.dart';

class CustomWidget {
  static Widget setText(String text,
      {Color textColor = Colors.black,
      double textSize = 14,
      FontWeight weight = FontWeight.normal,
      bool isUnderLine = false,
      double left = 0,
      double top = 0,
      double right = 0,
      double bottom = 0,
      double height = 1,
      int maxLines = 1,
      TextOverflow overflow = TextOverflow.visible,
      double textLineHeight = 0,
      double leading = 0,
      bool isMargin = true,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      textAlign = TextAlign.left}) {
    return Container(
      margin: isMargin
          ? EdgeInsets.only(left: left, top: top, right: right, bottom: bottom)
          : margin,
      child: Text(
        text,
        textAlign: textAlign,
        style: setTextStyle(textColor, textSize, weight, isUnderLine, height),
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  static TextStyle setTextStyle(Color? color, double? size,
      [FontWeight? weight, bool isUnderLine = false, double height = 1]) {
    return TextStyle(
      decoration: isUnderLine ? TextDecoration.underline : TextDecoration.none,
      decorationColor: color,
      color: color ?? Colors.black,
      decorationStyle: TextDecorationStyle.solid,
      fontSize: size,
      height: height,
      fontWeight: weight ?? FontWeight.normal,
    );
  }

  static Widget getNetPlaceImgForCorner(
    String path,
    double radius, {
    double width = 50,
    double height = 50,
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    BoxFit fit = BoxFit.cover,
    bool isLogo = false,
    bool isBq = false,
  }) {
    return path.isEmpty
        ? Image.asset(
            isBq
                ? "assets/icon/im/icon_baiqing_logo.png"
                : isLogo
                    ? "assets/icon/login/icon_logo_3x.png"
                    : "assets/icon/tab/icon_load_error.png",
            height: height,
            width: width)
        : Container(
            margin: EdgeInsets.only(
                left: left, top: top, right: right, bottom: bottom),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius)),
              child: LoadImage(
                path,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          );
  }
}
