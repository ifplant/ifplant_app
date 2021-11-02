import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

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
        childAspectRatio: 0.8,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: ontap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: Image.asset(path),
                height: 180,
                width: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    ));
  }
}
