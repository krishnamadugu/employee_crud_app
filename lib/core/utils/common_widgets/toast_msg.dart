import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/theme_constants/ui_constants/colors.dart';

dynamic showToastMsg(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.blackColor,
    textColor: AppColors.whiteColor,
    fontSize: 14.0,
  );
}
