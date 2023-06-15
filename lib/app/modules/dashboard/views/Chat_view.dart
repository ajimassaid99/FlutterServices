import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String title;

  ChatPage({required this.title});

  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> chatData = [];

  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Menambahkan pesan sambutan ke chatData saat halaman dimuat pertama kali
    chatData.add(ChatMessage(
      message: 'Selamat datang di Aplikasi 2PK Service! \nAda Yang Bisa DiBantu?',
      isUserMessage: false,
    ));
  }

  void _sendMessage() {
    String message = _messageController.text.trim();

    if (message.isNotEmpty) {
      setState(() {
        chatData.add(ChatMessage(
          message: message,
          isUserMessage: true,
        ));
        _messageController.clear();
      });
    }
  }

  Widget _buildChatList() {
    return Expanded(
      child: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (BuildContext context, int index) {
          return chatData[index];
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _buildChatList(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  ChatMessage({required this.message, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
