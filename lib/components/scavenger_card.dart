import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scavenger/models/landmark.dart';

class ScavengerCard extends StatelessWidget {
  Landmark landmark;

  ScavengerCard({super.key, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                content: Container(
                  child: Text(landmark.description),
                ),
              );
            }));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.network(landmark.imageUrl, height: 200,),
            Text(
              landmark.name,
              style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "# ${landmark.tag}",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
