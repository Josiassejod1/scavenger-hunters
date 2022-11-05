import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScavengerCard extends StatelessWidget {
  const ScavengerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                content: Container(
                  child: Text('Test'),
                ),
              );
            }));
      },
      child: Card(
        child: Column(
          children: [
            Image.network(
                "https://www.google.com/maps/uv?pb=!1s0x808586deffffffc3%3A0xcded139783705509!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipMkkRoxC1dY9_VA4HGQMlAzlVlAxbRgCo0K02v1%3Dw498-h320-k-no!5sgolden%20gate%20bridge%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipMkkRoxC1dY9_VA4HGQMlAzlVlAxbRgCo0K02v1&hl=en&sa=X&ved=2ahUKEwiBv7eF6JX7AhU7HUQIHRl5CjYQoip6BQiYARAD#"),
            const Text(
              "Golden Gate Bridge",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
