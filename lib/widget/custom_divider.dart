
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.004,
      decoration: BoxDecoration(

        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}

