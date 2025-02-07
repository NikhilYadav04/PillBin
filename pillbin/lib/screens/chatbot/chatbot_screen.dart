import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  bool _isLoading = false;
  bool _isGeminiTyping = false; // Track Gemini typing
  final Gemini gemini = Gemini.instance;
  final TextEditingController _textEditingController = TextEditingController();

  List<ChatMessage> messages = [];

  ChatUser currentUser =
      ChatUser(id: "0", firstName: "Nikhil", profileImage: "assets/icon.png");
  ChatUser geminiUser = ChatUser(
      id: "1", firstName: 'AI Assistant', profileImage: "assets/bot.png");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Your AI Assistant",
            style: TextStyle(
              color: Color.fromARGB(255, 4, 70, 124),
              fontFamily: "Hanken_Bold",
              fontWeight: FontWeight.bold,
              fontSize: 4.21348 * SizeConfig.heightMultiplier,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 172, 210, 238),
          toolbarHeight: 8.8 * SizeConfig.heightMultiplier,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            //* Chat UI
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                image: DecorationImage(
                  image: AssetImage("assets/summary.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: DashChatUI(),
            ),

            //* Loader
            // if (_isLoading)
            //   Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.blue,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget DashChatUI() {
    return DashChat(
        currentUser: currentUser,
        onSend: _sendMessages,
        messages: messages,
        inputOptions: InputOptions(
          sendButtonBuilder: (_) => SizedBox.shrink(),
          textController: _textEditingController,
          inputMaxLines: 5,
          inputTextStyle: TextStyle(fontFamily: "Glacial_Bold"),
          trailing: [
            IconButton(
              icon: Icon(
                Icons.send,
                size: 3.42809 * SizeConfig.heightMultiplier,
              ),
              color: Colors.blue,
              onPressed: () {
                if (_textEditingController.text.trim().isNotEmpty) {
                  _sendMessages(ChatMessage(
                    text: _textEditingController.text.trim(),
                    user: currentUser,
                    createdAt: DateTime.now(),
                  ));
                  _textEditingController.clear();
                }
              },
            ),
          ],
        ),
        typingUsers:
            _isGeminiTyping ? [geminiUser] : [], //* Show only Gemini typing
        messageOptions: MessageOptions(
          timeTextColor: Colors.black,
          currentUserContainerColor: Colours.Light_Blue,
          currentUserTimeTextColor: Colors.black,
          containerColor: Color.fromARGB(255, 223, 221, 221),
          currentUserTextColor: Colors.black,
          timeFontSize: 3.37079 * SizeConfig.heightMultiplier,
          showOtherUsersName: true,
          showCurrentUserAvatar: true,
        ));
  }

  void _sendMessages(ChatMessage chatMessage) async {
    setState(() {
      _isLoading = true;
      _isGeminiTyping = true;
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;
      print("Prompt is: $question");
      String fullResponse = "";
      const maxAttempts = 3;
      int attempt = 0;
      bool receivedResponse = false;

      while (attempt < maxAttempts) {
        try {
          if (attempt > 0) {
            _showRetryMessage(attempt);
          }

          final stream = gemini.streamGenerateContent(question);
          await for (final event in stream) {
            String newContent = event.content?.parts?.fold(
                  "",
                  (previous, current) => "$previous ${current.text}",
                ) ??
                "";

            if (newContent.isNotEmpty) {
              receivedResponse = true; // ✅ Flag to track response received
              fullResponse += newContent;

              if (messages.isNotEmpty && messages[0].user.id == geminiUser.id) {
                messages.removeAt(0);
              }

              messages = [
                ChatMessage(
                  user: geminiUser,
                  createdAt: DateTime.now(),
                  text: fullResponse,
                ),
                ...messages
              ];

              setState(() {});
            }
          }

          if (!receivedResponse) {
            throw Exception("No response received from Gemini.");
          }

          break; // Exit the loop if the stream completes successfully
        } catch (e) {
          print("Attempt ${attempt + 1} error: $e");
          attempt++;

          if (attempt == maxAttempts) {
            _showErrorMessage(
                "Service is currently unavailable. Please try again later.");
            return;
          }

          // Exponential backoff before retrying
          await Future.delayed(Duration(seconds: attempt * 2));
        }
      }
    } catch (e) {
      print("Final error: $e");
      _showErrorMessage("Failed to process request. Please try again.");
    } finally {
      setState(() {
        _isLoading = false;
        _isGeminiTyping = false;
      });
    }
  }

  void _showErrorMessage(String message) {
    setState(() {
      messages = [
        ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: message,
        ),
        ...messages
      ];
      _isLoading = false;
      _isGeminiTyping = false;
    });
  }

  void _showRetryMessage(int attempt) {
    setState(() {
      messages = [
        ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: "Server is busy. Retrying... (Attempt $attempt/3)",
        ),
        ...messages
      ];
    });
  }

  Future<void> _ImageMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (file != null) {
      ChatMessage message = ChatMessage(
          user: currentUser,
          createdAt: DateTime.now(),
          text:
              "Describe the picture you see and give some information about it?",
          medias: [
            ChatMedia(url: file.path, fileName: "", type: MediaType.image)
          ]);
      _sendMessages(message);
    }
  }
}
