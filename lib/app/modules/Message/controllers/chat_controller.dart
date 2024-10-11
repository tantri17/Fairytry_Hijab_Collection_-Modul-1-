import 'package:get/get.dart';
import 'package:mykoskutri/app/modules/Message/message.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;

  void sendMessage(String sender, String text) {
    messages.add(Message(sender: sender, text: text));
  }
}
