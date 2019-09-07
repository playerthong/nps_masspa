import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircleLoading extends StatelessWidget {
  Color color;
  double size;


  CircleLoading({this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color,
      size: size,
    );
  }


}