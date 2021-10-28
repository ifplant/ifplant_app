import 'package:flutter/material.dart';

class SelectPlantWidget extends StatelessWidget {
  final String name, path;
  final void Function()? ontap;
  const SelectPlantWidget({
    Key? key,
    required this.name,
    required this.path,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: ontap,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: Image.asset(path),
                  height: 300,
                ),
              ),
              Text(name),
            ],
          ),
        );
      },
    ));
  }
}
