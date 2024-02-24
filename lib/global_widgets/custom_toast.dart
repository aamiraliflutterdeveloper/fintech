import 'package:fluttertoast/fluttertoast.dart';

customToast(title) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}
