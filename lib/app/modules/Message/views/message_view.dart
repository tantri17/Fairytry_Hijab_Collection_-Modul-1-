import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart'; // Import controller yang sudah dibuat

class ChatView extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              // Menggunakan Obx untuk memperbarui UI secara otomatis
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ListTile(
                    title: Text(message.sender),
                    subtitle: Text(message.text),
                    trailing: Text(
                      message.timestamp
                          .toLocal()
                          .toString()
                          .split('.')[0], // Format timestamp
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      chatController.sendMessage(
                          "User", messageController.text);
                      messageController
                          .clear(); // Bersihkan field setelah mengirim
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
