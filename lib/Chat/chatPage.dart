import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seekhobuddy/Chat/chatUsersModel.dart';
import 'package:seekhobuddy/Chat/conversationList.dart';
import 'package:seekhobuddy/Chat/NewChatPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    // Add more ChatUsers with alternate image URLs here...
  ];

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  void loadUserDetails() async {
    List<ChatUsers> savedUsers = await getUserDetails();
    setState(() {
      chatUsers = savedUsers;
    });
  }

  Future<void> saveUserDetails(ChatUsers newUser) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> users = prefs.getStringList('users') ?? [];

    users.add(jsonEncode({
      'name': newUser.text,
      'message': newUser.secondaryText,
      'profile_picture': newUser.image,
      'time': newUser.time,
    }));

    await prefs.setStringList('users', users);
  }

  Future<List<ChatUsers>> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> users = prefs.getStringList('users') ?? [];

    return users.map((user) {
      Map<String, dynamic> attributes = jsonDecode(user);

      return ChatUsers(
        text: attributes['name'],
        secondaryText: attributes['message'],
        image: attributes['profile_picture'],
        time: attributes['time'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF161616), // Set background color to #161616
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final newChatUserDetails = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewChatPage()),
                          );

                          if (newChatUserDetails != null) {
                            ChatUsers newChatUser = ChatUsers(
                              text: newChatUserDetails['name'],
                              secondaryText:
                                  'Hello', // replace with appropriate value
                              image: newChatUserDetails['profile_picture'],
                              time: 'Now', // replace with appropriate value
                            );

                            // Save the new user details
                            await saveUserDetails(newChatUser);

                            // Update the chatUsers list
                            setState(() {
                              chatUsers.insert(0, newChatUser);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 2, bottom: 2),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF323232),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Add New",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Color(0xFF323232),
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF323232)),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                    name: chatUsers[index].text,
                    messageText: chatUsers[index].secondaryText,
                    imageUrl: chatUsers[index]
                        .image, // Use profile_picture from chatUsers
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
