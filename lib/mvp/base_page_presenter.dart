import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shengyu_weather_forecast/mvp/base_presenter.dart';
import 'package:shengyu_weather_forecast/net/net.dart';

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

  /// 返回Future 适用于刷新，加载更多
  Future<dynamic> requestNetwork<T>(
    Method method, {
    required String url,
    bool isShow = true,
    bool isClose = true,
    NetSuccessCallback<T?>? onSuccess,
    NetErrorCallback? onError,
    dynamic params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    if (isShow) {
      view.showProgress();
    }
    return DioUtils.instance.requestNetwork<T>(
      method,
      url,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
      onSuccess: (data) {
        if (isClose) {
          view.closeProgress();
        }
        final user = jsonDecode(data.toString());
        final Map<String, dynamic> temp = user as Map<String, dynamic>;
        if (temp['code'] == 401) {
          // view.showFrozen();
        } else {
          onSuccess?.call(data);
        }
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  void asyncRequestNetwork<T>(
    Method method, {
    required String url,
    bool isShow = true,
    bool isClose = true,
    NetSuccessCallback<T?>? onSuccess,
    NetErrorCallback? onError,
    dynamic params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    if (isShow) {
      view.showProgress();
    }
    DioUtils.instance.asyncRequestNetwork<T>(
      method,
      url,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
      onSuccess: (data) {
        if (isClose) {
          view.closeProgress();
        }
        final user = jsonDecode(data.toString());
        final Map<String, dynamic> temp = user as Map<String, dynamic>;
        if (temp['code'] == 401) {
          // view.showFrozen();
        } else {
          onSuccess?.call(data);
        }
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  void _onError(int code, String msg, NetErrorCallback? onError) {
    /// 异常时直接关闭加载圈，不受isClose影响
    view.closeProgress();
    if (code != ExceptionHandle.cancel_error) {
      view.showToast(msg);
    }

    /// 页面如果dispose，则不回调onError
    if (onError != null) {
      onError(code, msg);
    }
  }
}
