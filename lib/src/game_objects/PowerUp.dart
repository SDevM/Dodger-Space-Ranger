import 'package:flutter/material.dart';
import 'package:game_template/src/game_objects/Sprite.dart';

class PowerUp extends StatefulWidget {
  final double initX;
  final double initY;
  final double width;
  final double height;
  final String powerUp;
  const PowerUp({Key? key, required this.initX, required this.initY, required this.width, required this.height, required this.powerUp}) : super(key: key);

  @override
  State<PowerUp> createState() => _PowerUpState();
}

class _PowerUpState extends State<PowerUp> {
  late Sprite _sprite;
  final Map<String, AssetImage> images = {};
  @override
  Widget build(BuildContext context) {
    _sprite = Sprite(widget.initX, widget.initY, widget.width, widget.height, images[widget.powerUp]!);
    return Positioned(
      top: _sprite.box.top,
      left: _sprite.box.left,
      width: _sprite.box.width,
      height: _sprite.box.height,
      child: Image(image: _sprite.image),
    );
  }

  void move(double xOffset, double yOffset) {
    Rect box = _sprite.box;
    setState(() {
      _sprite.box = Rect.fromLTWH(box.left + xOffset, box.top + yOffset, box.width, box.height);
    });
  }

  void onCollide() {
    // TODO Collision stuff
  }
}
