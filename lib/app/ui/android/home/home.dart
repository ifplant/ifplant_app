import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget head() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 30),
          Text(
            '내공간',
            style: baseTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: GestureDetector(onTap: () {}, child: const Text('완료')),
          ),
        ],
      ),
    );
  }

  Widget myspace() {
    return Container(
      height: 500,
      color: Colors.amber,
    );
  }

  Widget myplant() {
    return Container(
      height: 200,
      width: 500,
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _button(),
        ],
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
        onPressed: () {},
        child: const Icon(
          Icons.add_circle,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            head(),
            myspace(),
            myplant(),
          ],
        ),
      ),
    );
  }
}
