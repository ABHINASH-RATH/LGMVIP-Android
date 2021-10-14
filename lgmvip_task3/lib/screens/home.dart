import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lgmtask3/screens/augmented_faces.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AR filter Task - LGMVIP',
          style: GoogleFonts.play(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(
                    "About AR Face",
                   
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "Lets Grow More Task.\nThis App apply AR filters on face.",
                         ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.copyright),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Developed by:\n Abhinash Rath",
                             ),
                        ],
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text("Close"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.info,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/ar.png",
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Apply AR.",
              style: GoogleFonts.play(),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AugmentedFacesScreen()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.camera_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Augmented Face",
                    style: GoogleFonts.play(),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
