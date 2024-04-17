import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shengyu_weather_forecast/util/colours.dart';
import 'package:shengyu_weather_forecast/util/my_button.dart';
import 'package:shengyu_weather_forecast/util/theme_util.dart';

/// Set AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.backgroundColor,
    this.title = '',
    this.centerTitle = '',
    this.actionName = '',
    this.backImg = 'assets/images/ic_back_black.png',
    this.backImgColor,
    this.titleColor,
    this.onPressed,
    this.isBack = true,
    this.actionWidget,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleWidget,
    this.goBackOnPressed,
  }) : super(key: key);

  final Color? backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final Color? backImgColor;
  final Color? titleColor;
  final String actionName;
  final VoidCallback? onPressed;
  final VoidCallback? goBackOnPressed;
  final bool isBack;
  final Widget? actionWidget;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? context.backgroundColor;

    final SystemUiOverlayStyle overlayStyle =
        ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    final Widget action = (actionName.isNotEmpty || actionWidget != null)
        ? Positioned(
            right: 8,
            child: Theme(
              data: Theme.of(context).copyWith(
                buttonTheme: const ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  minWidth: 60.0,
                ),
              ),
              child: actionWidget ??
                  MyButton(
                    key: const Key('actionName'),
                    minWidth: null,
                    text: actionName,
                    isGradient: false,
                    textColor: Colours.text,
                    //context.isDark ? Colours.dark_text : Colours.text,
                    backgroundColor: Colors.transparent,
                    onPressed: onPressed,
                  ),
            ),
          )
        : const SizedBox();

    final Widget back = isBack
        ? IconButton(
            onPressed: goBackOnPressed ??
                () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final isBack = await Navigator.maybePop(context);
                  if (!isBack) {
                    await SystemNavigator.pop();
                  }
                },
            tooltip: 'Back',
            padding: const EdgeInsets.all(12.0),
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 26,
              color: Colors.white,
            ),
          )
        : const SizedBox();

    final Widget titleWidget = this.titleWidget ??
        Semantics(
          namesRoute: true,
          header: true,
          child: Container(
            alignment:
                centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title.isEmpty ? centerTitle : title,
              style: TextStyle(
                  fontSize: titleFontSize ?? 16,
                  color: titleColor ?? Colors.black,
                  fontWeight: titleFontWeight ?? FontWeight.normal),
            ),
          ),
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Material(
        color: bgColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              titleWidget,
              back,
              action,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
