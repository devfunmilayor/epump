import 'package:flutter/material.dart';

class ProfieImageEdit extends StatelessWidget {
  const ProfieImageEdit({
    Key key,
    this.ingUrl,
    this.uploadImg,
  }) : super(key: key);
  final String ingUrl;
  final Function uploadImg;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
        Positioned(
          right: 2,
          top: 4,
          child: InkWell(
            onTap: uploadImg,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              padding: EdgeInsets.all(3),
              child: Icon(
                Icons.edit,
                size: 10,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
