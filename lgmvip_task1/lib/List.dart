import 'package:flutter/material.dart';

import 'Constants.dart';

class RegionData extends StatelessWidget {
  RegionData({
    required this.districtName,
    required this.active,
    required this.recovered,
    required this.confirmed,
    required this.deceased,
    this.addHeaderDefaults = false,
  });

  final String districtName;
  final String confirmed;
  final String active;
  final String recovered;
  final String deceased;
  final bool addHeaderDefaults;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataDecoration
                  : listDataDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  districtName,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SanFrancisco',
                    fontSize: 12,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataDecoration
                  : listDataDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  active,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.blue : Colors.cyan,
                    fontFamily: 'SanFrancisco',
                    fontSize: 12,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataDecoration
                  : listDataDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  confirmed,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        addHeaderDefaults ? Colors.deepOrange : Colors.orange,
                    fontFamily: 'SanFrancisco',
                    fontSize: 10,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          SizedBox(
            width: 2.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataDecoration
                  : listDataDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  recovered,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.green : Colors.green,
                    fontFamily: 'Spartan',
                    fontSize: 10,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: addHeaderDefaults
                  ? listHeaderDataDecoration
                  : listDataDecoration,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: Text(
                  deceased,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: addHeaderDefaults ? Colors.red : Colors.red,
                    fontFamily: 'SanFrancisco',
                    fontSize: 12,
                    fontWeight:
                        addHeaderDefaults ? FontWeight.bold : FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
