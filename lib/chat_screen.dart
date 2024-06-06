import 'package:flutter/material.dart';
import 'package:flutter_gemini_bot/flutter_gemini_bot.dart';
import 'package:flutter_gemini_bot/models/chat_model.dart';

void main() {
  runApp(ChatScreen());
}

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seekho Buddy AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Seekho Buddy AI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ChatModel> chatList = []; // Your list of ChatModel objects
  String apiKey = 'AIzaSyC71D4lCCZUcDBahTHoQkO7GA3IK1OD7NY'; // Replace with your actual API key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title,
        style: TextStyle(color: Colors.white), // Changed color to white
        ),
        
      ),
      body: FlutterGeminiChat(
        chatContext: 'you are a proffesor',
        chatList: chatList,
        apiKey: apiKey,
      ),
    );
  }
}
