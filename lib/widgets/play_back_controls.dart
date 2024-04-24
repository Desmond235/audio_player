import 'package:audio_player/components/neu_box.dart';
import 'package:flutter/material.dart';

class PlayBackControls extends StatelessWidget {
  const PlayBackControls({
    super.key,
    required this.icon,
    required this.onTap,
    this.flex =1
  });
  final IconData icon;
  final void Function() onTap;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: NeuBox(
          child: Icon(icon),
        ),
      ),
    );
  }
}
