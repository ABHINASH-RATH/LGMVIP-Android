import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';

import 'face.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? MyimageFile;
  List<Face>? Myfaces;
  bool isLoading = false;
  ui.Image? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 10,
          // centerTitle: true,
          title: Text(
            'Face Detector - Inter_App',
            style: TextStyle(
              fontFamily: 'SourceCodePro',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: CupertinoAlertDialog(
                      title: Text(
                        "About Face Detector",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '"LGMVIP- Internship"\nThis App Identifies the number of faces in an Image captured or uploaded from internal memory.',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: 'SourceCodePro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.copyright_rounded),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Developed by:\n Master ABHINASH RATH",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: 'SanFrancisco',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text(
                            "Close",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(CupertinoIcons.info_circle),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FloatingActionButton.extended(
                splashColor: Colors.red,
                backgroundColor: Colors.blueGrey,
                onPressed: () => getImage(ImageSource.camera),
                label: Row(
                  children: [
                    Icon(Icons.add_a_photo),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              FloatingActionButton.extended(
                splashColor: Colors.red,
                backgroundColor: Colors.blueGrey,
                onPressed: () => getImage(ImageSource.gallery),
                label: Row(
                  children: <Widget>[
                    Icon(Icons.image),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 10,
                  backgroundColor: Colors.amber,
                ),
              )
            : (MyimageFile == null)
                ? Center(
                    child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Colors.yellow, Colors.red, Colors.purple],
                        center: Alignment(0.6, -0.3),
                        focal: Alignment(0.3, -0.1),
                        focalRadius: 1.0,
                      ),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/Logo.png",
                          height: 250,
                          width: 250,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Capture or Select a Pic',
                          style: TextStyle(
                            fontFamily: 'SanFrancisco',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [0.1, 0.5, 0.8, 0.9],
                              colors: [
                                Colors.red,
                                Colors.yellow,
                                Colors.blue,
                                Colors.purple
                              ],
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2.0,
                          child: Center(
                              child: FittedBox(
                            child: SizedBox(
                              width: _image!.width.toDouble(),
                              height: _image!.height.toDouble(),
                              child: CustomPaint(
                                painter: FacePainter(_image!, Myfaces!),
                              ),
                            ),
                          )),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          //give box decoration to result
                          child: Text(
                            Myfaces!.length == 1
                                ? Myfaces!.length.toString() + " Face Found"
                                : Myfaces!.length.toString() + " Faces Found",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.blueGrey,
                              fontFamily: 'SanFrancisco',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ));
  }

  getImage(ImageSource source) async {
    final imageFile = await picker.pickImage(source: source);
    setState(() {
      isLoading = true;
    });

    final image = GoogleVisionImage.fromFile(File(imageFile!.path));
    final faceDetector = GoogleVision.instance.faceDetector();
    List<Face> faces = await faceDetector.processImage(image);

    if (mounted) {
      setState(() {
        MyimageFile = File(imageFile.path);
        Myfaces = faces;
        _loadImage(File(imageFile.path));
      });
    }
  }

  _loadImage(File file) async {
    final data = await file.readAsBytes();
    await decodeImageFromList(data).then((value) => setState(() {
          _image = value;
          isLoading = false;
        }));
  }
}
