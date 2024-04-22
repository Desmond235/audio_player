import 'package:audio_player/components/neu_box.dart';
import 'package:audio_player/provider/play_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                children: [
                  //custom app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  back button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                      ),

                      // title
                      const Text("P L A Y L I S T"),

                      // menu button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      )
                    ],
                  ),

                  // album artwork
                  Column(
                    children: [
                      NeuBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/phone.jpg',
                          ),
                        ),
                      ),

                      // song and artist name
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Victoria Orenze',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text('Victoria Orenze')
                            ],
                          ),

                          // heart icon
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  )

                  // dong duration progress

                  // playback controls
                ],
              ),
            ),
          )),
    );
  }
}
