import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({
    Key? key,
  }) : super(key: key);
  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          (keys.welcome),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.right,
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 15,
              fontStyle: FontStyle.italic),
        ),
        Text(
          ("buy the best one" * 10),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: ProjectColors.welcomeColor,
              ),

          ///burda ne yapıyoruz headline5 in tum özelliklerini al ama copywith ile de eziyoruz bazı özelliklerini
        ),
      ],
    )));
  }
}

class ProjectKeys {
  final String welcome = "Welcome";
}

class ProjectColors {
  static Color welcomeColor = Colors.red;
}

class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 15,
      fontStyle: FontStyle.italic);
}

