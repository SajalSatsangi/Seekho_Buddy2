import 'package:flutter/material.dart';
import 'package:seekhobuddy/ExploreMore/subjects.dart';

class Semesters extends StatelessWidget {
  final String branchName;
  final Map branchData;

  Semesters({required this.branchName, required this.branchData});

  @override
  Widget build(BuildContext context) {
    print(branchData);
    Map semesters = Map.from(branchData)..remove('branchName');

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
                        onPressed: () {
                          Navigator.of(context).pop(); // Navigate back
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        branchName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: semesters.length,
              itemBuilder: (context, index) {
                String semesterKey = semesters.keys.elementAt(index);
                if (semesters[semesterKey] is! Map) {
                  throw 'Expected a Map, but got ${semesters[semesterKey].runtimeType}';
                }
                Map semester = semesters[semesterKey];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 24.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 50, 50, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
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
                                  semester['semesterName'] ??
                                      'Default Semester Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
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
                                    builder: (context) => Subjects(
                                      semesterName: semester[
                                          'semesterName'], // assuming 'semesterName' is the key for the semester name
                                      semesterData:
                                          semester, // Pass the entire semester map
                                    ),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                              ),
                              child: Text(
                                'View',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
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
