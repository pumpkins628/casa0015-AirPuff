import 'package:flutter/material.dart';
import 'package:shengyu_weather_forecast/util/colours.dart';
import 'package:shengyu_weather_forecast/util/theme_util.dart';

class MyButton extends StatelessWidget {

  const MyButton({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 40.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.radius = 20.0,
    this.side = BorderSide.none,
    this.isGradient = true,
    required this.onPressed,
  }): super(key: key);

  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;
  final bool isGradient;//是否有渐变

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDark;
    return Container(
      height: minHeight,
      width: minWidth,
      //margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        gradient: isGradient?(onPressed != null ? const LinearGradient(
          colors: [
            Colours.mainGradientStart,
            Colours.mainGradientEnd,
          ],
        ): const LinearGradient(
          colors: [
            Colours.unselected_item_color,
            Colours.unselected_item_color,
          ],
        )) : (onPressed != null ? const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        ): const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
          ],
        )
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            // 文字颜色
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledTextColor ?? (isDark ? Colors.white : Colors.white);
              }
              return textColor ?? (isDark ? Colors.white : Colors.white);
            },
            ),
            // 背景颜色
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledBackgroundColor ?? (isDark ? Colors.transparent : Colors.transparent);
              }
              return backgroundColor ?? (isDark ? Colors.transparent : Colors.transparent );
            }),
            // 水波纹
            overlayColor: MaterialStateProperty.resolveWith((states) {
              return (textColor ?? (isDark ? Colours.dark_button_text : Colors.white)).withOpacity(0.12);
            }),
            // 按钮最小大小
            minimumSize: (minWidth == null || minHeight == null) ? null : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
            visualDensity: VisualDensity.compact,
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(side),
          ),
          child: Text(text, style: TextStyle(fontSize: fontSize),)
      ),
    );

  }
}
