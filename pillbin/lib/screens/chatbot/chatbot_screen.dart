import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:pillbin/controller/GetX_report.dart';
import 'package:pillbin/services/reportService.dart';
import 'package:pillbin/styling/colors/colors.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:http/http.dart' as http;
import 'package:pillbin/styling/widgets/chatbot_widgte.dart';
import 'package:pillbin/styling/widgets/toast.dart';

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
  final GetxReport controller = Get.put(GetxReport());
  final ReportService reportService =
      ReportService(baseURL: dotenv.get("baseURL"));
  String questionChat = "";

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
          ],
        ),

        //* persistent bottom bar
        persistentFooterAlignment: AlignmentDirectional.bottomCenter,
        backgroundColor: Color.fromARGB(255, 193, 223, 248),
        persistentFooterButtons: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 1.5625 * SizeConfig.widthMultiplier,
                  vertical: 0.84269 * SizeConfig.heightMultiplier),
              child: Text(
                "Found something inappropriate? Tap 'Report' below any message to help us improve by flagging offensive or harmful content.",
                style: TextStyle(
                  fontFamily: "Hanken_Medium",
                  fontWeight: FontWeight.bold,
                  fontSize: 1.9 * SizeConfig.heightMultiplier,
                ),
              ))
        ],
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
          textBeforeMedia: true,
          messageTextBuilder: (message, previousMessage, nextMessage) {
            return message.user.id == currentUser.id
                ? SelectableText(
                    message.text, // The message text
                    style: TextStyle(
                      color: message.user.id == currentUser.id
                          ? Colors.black // Current user text color
                          : Colors.black, // Other users text color
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        message.text,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Glacial_Bold",
                        ),
                      ),
                      SizedBox(
                        height: 4.213484 * SizeConfig.heightMultiplier,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return reportCard(
                                      context,
                                      controller,
                                      questionChat,
                                      message.text,
                                      reportService);
                                });
                            //* report content
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0.84269 * SizeConfig.heightMultiplier),
                            ),
                          ),
                          child: Text(
                            "Report Response",
                            style: TextStyle(
                              fontSize: 1.47471 * SizeConfig.heightMultiplier,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          },
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
      questionChat = chatMessage.text;
    });

    try {
      String question = "${chatMessage.text} . Give answer in 200 words";
      print("Prompt is: $question");
      const maxAttempts = 3;
      int attempt = 0;

      // //* check the question is valid
      final response = await reportService.checkUserAskedQuestion(questionChat);

      if (response != "Success") {
        toastErrorSlide(context, response);
        setState(() {
          _isLoading = false;
          _isGeminiTyping = false;
        });
        return;
      }

      bool receivedResponse = false;
      String fullResponse = "";

      while (attempt < maxAttempts) {
        try {
          if (attempt > 0) {
            _showRetryMessage(attempt);
          }

          print("Making API call to localhost...");
          // final IP = await dotenv.get('PC_IP');
          final response = await http.post(
            Uri.parse("https://gemini-server-2.onrender.com/generate"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"prompt": question}),
          );

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            fullResponse = data["response"] ?? "";
            receivedResponse = fullResponse.isNotEmpty;
          } else {
            throw Exception("Invalid response: ${response.statusCode}");
          }

          if (!receivedResponse) {
            throw Exception("No response received from API.");
          }

          // //* check if response is valid
          final response_valid =
              await reportService.checkResponseGemini(fullResponse);

          var logger = Logger();
          logger.d(fullResponse);

          if (response_valid != "Success") {
            _isLoading = false;
            _isGeminiTyping = false;
            break;
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
          break; // Exit the loop on success
        } catch (e) {
          print("Attempt ${attempt + 1} error: $e");
          attempt++;

          if (attempt == maxAttempts) {
            _showErrorMessage(
                "Service is currently unavailable. Please try again later.");
            return;
          }

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
}
