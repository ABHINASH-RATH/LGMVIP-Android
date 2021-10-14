import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'List.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  final bool isState;

  Delegate({required this.isState});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: RegionData(
        districtName: isState ? 'State' : 'City',
        confirmed: 'Confirmed',
        active: 'Active',
        recovered: 'Recovered',
        deceased: 'Death',
        addHeaderDefaults: true,
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
