import 'package:audio_player/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S E T T I N G S'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dark Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            // switch
            Switch(
              value: Provider.of<ThemesProvider>(context, listen: false)
                  .isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemesProvider>(context, listen: false)
                      .toggleTheme(),
            )
          ],
        ), 
      ),
    );
  }
}