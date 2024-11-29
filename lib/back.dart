import 'package:flutter/widgets.dart';

class Bachgroundimage extends StatelessWidget {
  const Bachgroundimage({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Container(
      height: size.height * 0.46,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/rddd.avif"),fit: BoxFit.cover)),
      
    );
  }
}
