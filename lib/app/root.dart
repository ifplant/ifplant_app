import 'package:flutter/material.dart';

import 'ui/android/screens.dart' show Home;

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO : 조건부 이동( 필요시 추가 )
    return Home();
  }
}
