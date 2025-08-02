import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneNumber = "".obs; // Stores phone number dynamically
  var password = "".obs; // Add this line to store password

  void updatePhoneNumber(String number) {
    phoneNumber.value = number;
  }



  void onNextPressed() {
    if (phoneNumber.value.isNotEmpty) {
      Get.toNamed("/userPassword");
    } else {
      Get.snackbar(
        "Invalid",
        "Please enter a valid phone number",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
