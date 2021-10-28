import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _head() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
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
        ],
      ),
    );
  }

  Widget _myspace() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 500,
        child: Image.network(
          'https://i.pinimg.com/originals/de/bb/ff/debbff2321788a6d4a7b3bb00237a76e.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed('/plant');
      },
      child: const Icon(
        Icons.add_circle,
        size: 50,
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
      ),
    );
  }

  Widget _addplant() {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: _button(),
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          )
        ],
      ),
    );
  }

  Widget _myplant() {
    return Container(
      height: 200,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _addplant(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _head(),
              _myspace(),
              _myplant(),
            ],
          ),
        ),
      ),
    );
  }
}
