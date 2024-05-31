import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewChatPage extends StatefulWidget {
  @override
  _NewChatPageState createState() => _NewChatPageState();
}

class _NewChatPageState extends State<NewChatPage> {
  TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> users = []; // This list will store the fetched users

  void searchUsers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: searchController.text)
        .get();

    setState(() {
      users = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: searchUsers,
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF161616), // Set background color to #161616
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            var userData = users[index].data() as Map<String, dynamic>?;
            return ListTile(
              title: Text(
                userData != null ? userData['name'] : 'Unknown',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                if (userData != null) {
                  Navigator.pop(context, {
                    'name': userData['name'],
                    'profile_picture': userData['profile_picture'],
                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
