import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget plantModel = Container(
    margin: const EdgeInsets.only(right: 4),
    height: 100,
    width: 80,
    color: Colors.red,
  );

  List<Widget> plants = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text('내공간', style: appBarTitleTextStyle),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                '완료',
                style: appBarActionTextStyle,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 336,
                height: 336,
                child: Image.network(
                  'https://i.pinimg.com/originals/de/bb/ff/debbff2321788a6d4a7b3bb00237a76e.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '내 화분',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return plants[index];
                        },
                        itemCount: plants.length,
                      ),
                      plants.length < 10
                          ? SizedBox(
                              height: 46,
                              width: 46,
                              child: InkWell(
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: primaryColor,
                                ),
                                onTap: () {
                                  setState(() {
                                    plants.add(plantModel);
                                  });
                                },
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
