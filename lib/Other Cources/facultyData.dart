import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'branches.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Faculties extends StatelessWidget {
  final String baseUrl =
      'https://seekhobuddy-server-36eb88311fa9.herokuapp.com'; // Change this to your backend URL

  Future<Map<String, dynamic>> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Try to get data from shared preferences
    String? facultiesDataString = prefs.getString('facultiesData');
    String? lastUpdatedString = prefs.getString('lastUpdated');

    DateTime lastUpdated = lastUpdatedString != null
        ? DateTime.parse(lastUpdatedString)
        : DateTime.now().subtract(Duration(
            days:
                2)); // Subtract 2 days to ensure data is fetched the first time

    if (facultiesDataString != null &&
        DateTime.now().difference(lastUpdated).inDays < 1) {
      print('Data retrieved from local storage: $facultiesDataString');
      return json.decode(facultiesDataString);
    }

    // If not available in shared preferences or it's been more than a day, fetch from API
    final response = await http.get(Uri.parse('$baseUrl/faculties'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Fetched data: $data');

      // Store data to shared preferences
      prefs.setString('facultiesData', json.encode(data));
      prefs.setString('lastUpdated', DateTime.now().toIso8601String());

      return data;
    } else {
      throw Exception('Failed to load faculties');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Faculties",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 20.0), // Adjust the padding as needed
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.white)),
              );
            }
            final facultiesData = snapshot.data;
            print(
                'Data type: ${facultiesData.runtimeType}'); // This will print the type of the data
            if (facultiesData is Map) {
              print(
                  'Data keys: ${facultiesData?.keys}'); // This will print the keys of the data if it's a Map
            }
            if (facultiesData == null ||
                !facultiesData.containsKey('faculties')) {
              return Center(
                child: Text('Unexpected data format',
                    style: TextStyle(color: Colors.white)),
              );
            }
            final faculties = facultiesData['faculties'].values.toList();
            return ListView.builder(
              itemCount: faculties.length,
              itemBuilder: (context, index) {
                final faculty = faculties[index];
                final String name = faculty['facultyName'];
                print(
                    'Faculty name: $name'); // This will print the faculty name
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xFF323232),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20)),
                            child: Image.asset(
                              index == 3
                                  ? 'assets/comm.png'
                                  : index == 1
                                      ? 'assets/edu.png'
                                      : index == 0
                                          ? 'assets/eng.png'
                                          : index == 2
                                              ? 'assets/art.png'
                                              : index == 4
                                                  ? 'assets/eng.png'
                                                  : index == 5
                                                      ? 'assets/sci.png'
                                                      : index == 6
                                                          ? 'assets/tec.png'
                                                          : 'assets/search_result.png',
                              width: 131,
                              height: 131,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 30.0,
                                  width: 75.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        SlideRightPageRoute(
                                          page: Branches(
                                            facultyName: name,
                                            facultyData: faculty,
                                          ),
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
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SlideRightPageRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightPageRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
