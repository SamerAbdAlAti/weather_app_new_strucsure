

import 'package:flutter/cupertino.dart';

class AppColor {

  static const Gradient  notBlueSky= LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.0),
    colors: [Color(0xff162840), Color(0xff3d6684)],
    stops: [0.0, 1.0],
  );
  static const Gradient  blueSky=  LinearGradient(
    begin: Alignment(0.0, -1.0),
    end: Alignment(0.0, 1.0),
    colors: [Color(0xfffea085), Color(0xfff6ce64)],
    stops: [0.0, 1.0],
  );


}