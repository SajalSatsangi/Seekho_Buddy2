import 'package:flutter/material.dart';
import 'package:seekhobuddy/ExploreMore/Semesters.dart';

class Branches extends StatelessWidget {
  final String facultyName;
  final Map facultyData;

  Branches({required this.facultyName, required this.facultyData});

  @override
  Widget build(BuildContext context) {
    print(facultyData);

    List branches = facultyData['branches'].values.toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Branches",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14, left: 14, right: 14),
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
          Expanded(
            child: ListView.builder(
              itemCount: branches.length,
              itemBuilder: (context, index) {
                var branch = branches[index];

                return Padding(
                  // Reduced vertical padding to decrease space between items
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  branch['branchName'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Semesters(branch: branch as Map),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text(
                                'View',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
