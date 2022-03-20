import 'package:flutter/material.dart';

class OtherAuth extends StatelessWidget {
  const OtherAuth({
    Key key,
    this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.075,
      width: size.width * 0.38,
      decoration: BoxDecoration(
        // color: Color(0xff171717),
        border: Border.all(color: Colors.grey.shade500, width: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 23,
      ),
    );
  }
}
