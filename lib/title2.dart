

import 'package:ai_project/title.dart';
import 'package:flutter/material.dart';

class cardescrption extends StatelessWidget {
  const cardescrption({
    super.key,
    
  });

 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.7,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const titletext(),
        const SizedBox(
          height: 30,
        ),
        Text(
          "*********************************************************************************************",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                letterSpacing: 1.3,
                height: 1,
              ),
        )
      ]),
    );
  }
}
