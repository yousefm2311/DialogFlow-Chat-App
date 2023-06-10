import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerHome extends GetxController {
  List<String> message = [];

  ControllerHome() {
    iconChange();
  }

  TextEditingController messageController = TextEditingController();

  void addMessage() {
    message.add(messageController.text);
    messageController.clear();
    update();
  }

  RxBool isEmpty = false.obs;

  void iconChange() {
    if (messageController.text.isEmpty) {
      isEmpty.value = true;
      update();
    } else {
      isEmpty.value = false;
      update();
    }
  }
}
