import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:lgmvip_task1/DataWork.dart';
import 'dart:convert';
import 'DataModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String _url = 'https://api.covid19india.org/state_district_wise.json';
  Map<String, dynamic> covidData = {};
  List<CovidData> cityData = [];
  List<CovidData> stateData = [];

  void _getCovidData() async {
    final response = await http.get(
      Uri.parse(_url),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode != 200) {
      return;
    }

    covidData = jsonDecode(response.body);

    covidData.forEach((key, value) {
      int totalActive = 0;
      int totalRecovered = 0;
      int totalConfirmed = 0;
      int totalDeceased = 0;

      value['districtData'].forEach((key, value) {
        cityData.add(new CovidData(key, value['active'], value['recovered'],
            value['confirmed'], value['deceased']));

        totalActive += int.parse(value['active'].toString()) > 0
            ? int.parse(value['active'].toString())
            : 0;
        totalRecovered += int.parse(value['recovered'].toString()) > 0
            ? int.parse(value['recovered'].toString())
            : 0;
        totalConfirmed += int.parse(value['confirmed'].toString()) > 0
            ? int.parse(value['confirmed'].toString())
            : 0;
        totalDeceased += int.parse(value['deceased'].toString()) > 0
            ? int.parse(value['deceased'].toString())
            : 0;
      });

      stateData.add(new CovidData(
          key, totalActive, totalRecovered, totalConfirmed, totalDeceased));
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return DataWork(
        covidData: this.cityData,
        stateData: this.stateData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();

    _getCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
          child: SpinKitWanderingCubes(
            shape: BoxShape.circle,
            size: 50,
            color: Colors.red,
            duration: Duration(milliseconds: 1800),
          ),
        ));
  }
}
