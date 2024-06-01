import 'package:flutter/material.dart';
import 'package:seekhobuddy/ExploreMore/materialPage.dart';

class Materialsectionpage extends StatelessWidget {
  final Map subject;

  Materialsectionpage({required this.subject});

  @override
  Widget build(BuildContext context) {
    print(subject);
    Map materials = Map.from(subject)..remove('subjectName');

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
                        "Materialsectionpage",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
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
              itemCount: materials.length,
              itemBuilder: (context, index) {
                String materialKey = materials.keys.elementAt(index);
                Map material = materials[materialKey];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 27.0),
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
                                  material['materialName'] ??
                                      'Default Material Name',
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
                                      builder: (context) =>
                                          Materialpage(material: material)),
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
