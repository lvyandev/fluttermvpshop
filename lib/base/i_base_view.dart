import 'package:flutter/cupertino.dart';

abstract class IBaseView {
  showLoading();

  showMessage({String message: ''});

  hideLoading();

  BuildContext get currentContext;
}
