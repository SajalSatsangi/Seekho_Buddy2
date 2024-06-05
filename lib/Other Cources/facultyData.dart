import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'branches.dart';

class Faculties extends StatelessWidget {
  Future<List<QueryDocumentSnapshot>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('seekhobuddydb').get();
    return querySnapshot.docs;
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
        child: FutureBuilder<List<QueryDocumentSnapshot>>(
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
            final documents = snapshot.data;
            return ListView.builder(
              itemCount: documents?.length,
              itemBuilder: (context, index) {
                final document = documents?[index];
                print(
                    'Document ID: ${document?.id}'); // This will print the document ID

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
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.035),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.02),
                                Text(
                                  document?.id ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
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
                                            facultyName: document?.id ?? '',
                                            facultyData: document?.data()
                                                    as Map<String, dynamic> ??
                                                {},
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
