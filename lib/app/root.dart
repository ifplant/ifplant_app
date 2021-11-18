import 'package:flutter/material.dart';

import 'ui/android/screens.dart' show Home;

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
