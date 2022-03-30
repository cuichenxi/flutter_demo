import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import '../utils/toast_utils.dart';
import '../widgets/progress_dialog.dart';

mixin BasePageMixin<T extends StatefulWidget> on State<T> {

  BuildContext getContext() {
    return context;
  }

  void closeProgress() {
    if (mounted && _isShowDialog) {
      _isShowDialog = false;
      BoostNavigator.instance.pop();
    }
  }

  bool _isShowDialog = false;

  @override
  void initState() {
    super.initState();
  }

  void showProgress() {
    /// 避免重复弹出
    if (mounted && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          barrierColor: const Color(0x00FFFFFF), // 默认dialog背景色为半透明黑色，这里修改为透明（1.20添加属性）
          builder:(_) {
            return WillPopScope(
              onWillPop: () async {
                // 拦截到返回键，证明dialog被手动关闭
                _isShowDialog = false;
                return Future.value(true);
              },
              child: buildProgress(),
            );
          },
        );
      } catch(e) {
        /// 异常原因主要是页面没有build完成就调用Progress。
        debugPrint(e.toString());
      }
    }
  }


  void showToast(String string) {
    Toast.show(string);
  }

  /// 可自定义Progress
  Widget buildProgress() => const ProgressDialog(hintText: '正在加载...');




}
