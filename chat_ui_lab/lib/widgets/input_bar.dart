import 'package:flutter/material.dart';

// 1. Changed from StatelessWidget to StatefulWidget
class InputBar extends StatefulWidget {
  final Function(String) onSendMessage;

  // 2. Corrected typo from 'kye' to 'key' and 'onSentMessage' to 'onSendMessage'
  const InputBar({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  // 3. createState is part of StatefulWidget
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // 4. Moved _sentMessage method inside the State class
  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      widget.onSendMessage(text);
      _textController.clear();
    }
  }

  @override
  // 5. Corrected the build method signature and moved it inside the State class
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                // 6. Corrected hintText syntax
                hintText: 'Type your message...',
                // 7. Corrected borderRadius syntax
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              // Allows sending the message by pressing the 'done' or 'send' key on the keyboard
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          // 8. Added an IconButton to send the message
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
