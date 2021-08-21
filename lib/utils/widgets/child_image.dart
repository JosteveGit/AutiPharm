
import 'package:flutter/material.dart';

class ChildImage extends StatelessWidget {
  const ChildImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 105,
        width: 107,
        child: Image.network(
          "https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}