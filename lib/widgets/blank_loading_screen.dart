import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BlankLoadingScreen extends StatelessWidget {
  const BlankLoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => const SpinKitCircle(color: Colors.red);
}