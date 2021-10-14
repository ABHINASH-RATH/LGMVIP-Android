import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DataModel.dart';
import 'Delegate.dart';
import 'List.dart';

class DataWork extends StatefulWidget {
  DataWork({required this.covidData, required this.stateData});

  final List<CovidData> covidData;
  final List<CovidData> stateData;

  @override
  DataWorkState createState() => DataWorkState();
}

class DataWorkState extends State<DataWork> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  bool isState = false;

  String convertToString(int value) {
    String convertedString;

    value > 1000000
        ? convertedString = (value / 1000000).round().toString() + 'M'
        : value > 1000
            ? convertedString = (value / 1000).round().toString() + 'K'
            : convertedString = value.toString();

    return convertedString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 8.0),
            child: Text(
              "State/City",
              style: TextStyle(
                color: Colors.blueAccent,
                fontFamily: 'SanFrancisco',
              ),
            ),
          ),
          Switch(
            value: isState,
            onChanged: (value) {
              setState(() {
                isState = !isState;
              });
            },
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.red,
          ),
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
                      "About Covid-19 Tracking App",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '"LGMVIP- Internship"\nThis App fetches the Covid-19 data across the states and cities of "INDIA".',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'SanFrancisco',
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
        leading: GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: CupertinoAlertDialog(
                  title: Text(
                    "Novel Corona Virus  ",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '"About corona"\n COVID-19 is the disease caused \n'
                        'by a new coronavirus called SARS-CoV-2. \n'
                        ' WHO first learned of this new virus on 31 December 2019, \n'
                        'following a report of a cluster of cases\n'
                        ' of ‘viral pneumonia’ in Wuhan, People’s Republic of China.',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'SanFrancisco',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: Colors.white70,
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => launch("tel://9439994859"),
                                  child: Text(
                                    "Helpline Number : +91-9439994859\n",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: 'SanFrancisco',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () => launch("tel://1075"),
                                  child: Text(
                                    " Toll Free : 1075\n ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: 'SanFrancisco',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () => launch(
                                      "mailto:ncov2019@gov.in?subject=&body="),
                                  child: Text(
                                    "Email: ncov2019@gov.in",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: 'SanFrancisco',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
          child: Icon(
            Icons.coronavirus_outlined,
            size: 85,
            color: Colors.red,
          ),
        ),
        title: GestureDetector(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: CupertinoAlertDialog(
                  title: Text(
                    "Novel Corona Virus  ",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '"About corona"\n COVID-19 is the disease caused \n'
                        'by a new coronavirus called SARS-CoV-2. \n'
                        ' WHO first learned of this new virus on 31 December 2019, \n'
                        'following a report of a cluster of cases\n'
                        ' of ‘viral pneumonia’ in Wuhan, People’s Republic of China.',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'SanFrancisco',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: Colors.white70,
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => launch("tel://9439994859"),
                                  child: Text(
                                    "Helpline Number : +91-9439994859\n",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: 'SanFrancisco',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () => launch("tel://1075"),
                                  child: Text(
                                    " Toll Free : 1075\n ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: 'SanFrancisco',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () => launch(
                                      "mailto:ncov2019@gov.in?subject=&body="),
                                  child: Text(
                                    "Email: ncov2019@gov.in",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontFamily: 'SanFrancisco',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
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
          child: Text(
            'Covid-19 Tracking',
            style: TextStyle(
              // color: Colors.red,
              foreground: Paint()..shader = linearGradient,
              fontFamily: 'SanFrancisco',
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: CustomScrollView(
            physics: PageScrollPhysics(),
            //physics: const BouncingScrollPhysics()
            scrollDirection: Axis.vertical,
            slivers: [
              SliverAppBar(
                expandedHeight: 260,
                floating: false,
                pinned: false,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    " For more info tap the 'Red' Covid-19 icon in the upper left \n corner.",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Sanfrancisco',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  background: Image.asset(
                    'assets/Logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: Delegate(isState: isState),
                pinned: true,
                floating: true,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return Container();
                  }

                  String regionName;
                  int confirmed;
                  int active;
                  int recovered;
                  int deceased;

                  if (isState) {
                    regionName = widget.stateData[index].districtName;
                    confirmed = widget.stateData[index].confirmed;
                    active = widget.stateData[index].active;
                    recovered = widget.stateData[index].recovered;
                    deceased = widget.stateData[index].deceased;
                  } else {
                    regionName = widget.covidData[index].districtName;
                    confirmed = widget.covidData[index].confirmed;
                    active = widget.covidData[index].active;
                    recovered = widget.covidData[index].recovered;
                    deceased = widget.covidData[index].deceased;
                  }

                  return RegionData(
                    districtName: regionName,
                    confirmed:
                        confirmed == 0 ? '-' : convertToString(confirmed),
                    active: active == 0 ? '-' : convertToString(active),
                    recovered:
                        recovered == 0 ? '-' : convertToString(recovered),
                    deceased: deceased == 0 ? '-' : convertToString(deceased),
                  );
                },
                childCount:
                    isState ? widget.stateData.length : widget.covidData.length,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
