import 'package:flutter/material.dart';

class titletext extends StatelessWidget {
  const titletext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: "*************************",
      style: Theme.of(context)
      .textTheme
      .headlineSmall
      ?.copyWith(
       color: Colors.white,
       letterSpacing: 1.2,
       fontWeight: FontWeight.bold,
       ),children:const [TextSpan(
        text: " ******** ",
        style: TextStyle(color: Color.fromARGB(255, 12, 71, 182)))]
       
    ));
  }
}
