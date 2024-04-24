import 'package:audio_player/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  const NeuBox({super.key, required this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemesProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker color on the bottom right
          BoxShadow(
            color:isDarkMode ? Colors.black : Colors.grey.shade300,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),

          // darker color on the bottom left
           BoxShadow(
            color: isDarkMode ? Colors.grey.shade800 : Colors.white,
            blurRadius: 15,
            offset: const Offset(-4, -4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
