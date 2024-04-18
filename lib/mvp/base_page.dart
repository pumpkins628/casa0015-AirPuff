import 'package:flutter/material.dart';
import 'package:air_puff/mvp/base_presenter.dart';
import 'package:air_puff/util/toast_util.dart';

import 'mvps.dart';

mixin BasePageMixin<T extends StatefulWidget, P extends BasePresenter>
    on State<T> implements IMvpView {
  P? presenter;

  P createPresenter();

  @override
  BuildContext getContext() {
    return context;
  }

  @override
  void closeProgress() {
    if (mounted && _isShowDialog) {
      _isShowDialog = false;
      Navigator.pop(context);
    }
  }

  bool _isShowDialog = false;

  @override
  void showProgress() {
    /// 避免重复弹出
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          barrierColor: const Color(0x00FFFFFF),
          // 默认dialog背景色为半透明黑色，这里修改为透明（1.20添加属性）
          builder: (_) {
            return const SizedBox();
          },
        );
      } catch (e) {
        /// 异常原因主要是页面没有build完成就调用Progress。
        debugPrint(e.toString());
      }
    }
  }

  @override
  void showToast(String string) {
    Toast.show(string);
  }

  @override
  void didChangeDependencies() {
    presenter?.didChangeDependencies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    presenter?.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    presenter?.deactivate();
    super.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    presenter?.didUpdateWidgets<T>(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    presenter = createPresenter();
    presenter?.view = this;
    presenter?.initState();
    super.initState();
  }
}
