import 'dart:ui';
import 'package:flutter/material.dart';

void showMaintenanceNotice(
    BuildContext context, String title, String description, String fileUrl) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 56, 56, 56),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            contentPadding: EdgeInsets.zero,
            content: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth < 600
                        ? constraints.maxWidth * 0.8
                        : 500, // Use a fixed width for larger screens
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 39, 39, 39),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                description,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                "By-XYZ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(20.0),
                          ),
                          child: Image.network(
                            fileUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: constraints.maxWidth < 600
                                ? 200
                                : 300, // Adjust height based on screen size
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 2 * animation.value, sigmaY: 2 * animation.value),
        child: ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          child: child,
        ),
      );
    },
  );
}
