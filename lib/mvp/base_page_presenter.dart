import 'package:dio/dio.dart';
import 'package:air_puff/mvp/base_presenter.dart';

import 'mvps.dart';

class BasePagePresenter<V extends IMvpView> extends BasePresenter<V> {
  BasePagePresenter() {
    _cancelToken = CancelToken();
  }

  late CancelToken _cancelToken;

  @override
  void dispose() {
    /// 销毁时，将请求取消
    // print(_cancelToken.isCancelled);
    if (!_cancelToken.isCancelled) {
      _cancelToken.cancel();
    }
  }

}
