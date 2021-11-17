import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:permission_handler/permission_handler.dart';

class InitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _requestPermission();
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    Fluttertoast.showToast(
      msg: info,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: secondaryColor,
    );
  }
}
