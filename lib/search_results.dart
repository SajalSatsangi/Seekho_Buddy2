import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Materials',
      theme: ThemeData.dark(),
      home: StudyMaterialsScreen(),
    );
  }
}

class StudyMaterialsScreen extends StatefulWidget {
  @override
  _StudyMaterialsScreenState createState() => _StudyMaterialsScreenState();
}

class _StudyMaterialsScreenState extends State<StudyMaterialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: MediaQuery.of(context).size.width *
              0.8, // Reduce the length of the search bar
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for study materials',
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  // Clear the search field logic
                },
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Options below the header
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildOption('Top'),
                buildOption('Subjects', isSelected: true),
                buildOption('Exams'),
                buildOption('Resources'),
                buildOption('Library'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0), // Space below the header
              child: ListView(
                children: [
                  buildListTile('Study Buddy', 'Connect with peers'),
                  buildDividerWithPadding(),
                  buildListTile('Simple study tips', 'Note-taking'),
                  buildDividerWithPadding(),
                  buildListTile('Educator Profile', 'Teaching strategies'),
                  buildDividerWithPadding(),
                  buildListTile('Discussion forum', 'Virtual Study Group'),
                  buildDividerWithPadding(),
                  buildListTile('Study group collaboration', 'Study Partners'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey, // Set the color of the bottom bar to gray
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,
                color: Colors.white), // Set the message icon color
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white),
            label: '',
          ),
        ],
        currentIndex: 1, // Set the current index to match the selected tab
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

  Widget buildOption(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isSelected)
          Container(
            margin: EdgeInsets.only(top: 4.0),
            height: 2.0,
            width: 20.0,
            color: Colors.white,
          ),
      ],
    );
  }

  Widget buildListTile(String title, String subtitle) {
    return ListTile(
      leading: ClipOval(
        child: Image.asset('assets/search_result.png',
            width: 55, height: 70, fit: BoxFit.fill), // Circular image
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Widget buildDividerWithPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Padding between the ListTile and Divider
      child: Divider(
        color: Colors.grey, // Color of the divider
        thickness: 1.0, // Thickness of the divider
        indent: 30.0, // Left padding of the divider
        endIndent: 20.0, // Right padding of the divider
      ),
    );
  }
}
