import 'package:flutter/material.dart';
import 'package:super_heroes/models/super_heroes_model.dart';

class Avatar extends StatelessWidget {
  final radius;
  final Images? img;

  const Avatar({
    Key? key,
    @required this.img,
    this.radius = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: new Offset(0.0, 0.0),
            blurRadius: 2.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(
            "${img!.url.toString()}",
          ),
        ),
      ),
    );
  }
}
