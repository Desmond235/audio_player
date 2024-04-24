import 'package:audio_player/components/neu_box.dart';
import 'package:audio_player/provider/play_list_provider.dart';
import 'package:audio_player/widgets/play_back_controls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String formatTime(Duration duration) {
    String twoDigitsSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = '${duration.inMinutes}: $twoDigitsSeconds';

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, value, child) {
        // get play list
        final playList = value.playList;

        // get the current  song
        final currentSong = playList[value.currentSongIndex!];

        // return scaffold
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //custom app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  back button
                      IconButton(
                        onPressed: () => Navigator.pop(context),
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
                            currentSong.albumImagePath,
                          ),
                        ),
                      ),

                      // song and artist name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSong.songName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(currentSong.artistName)
                            ],
                          ),

                          // heart icon
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),

                  // song duration progress
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start time
                            Text(formatTime(value.currentDuration)),

                            // shuffle icon
                            const Icon(Icons.shuffle),

                            // repeat icon
                            const Icon(Icons.repeat),

                            //  end time
                            Text(formatTime(value.totalDuration))
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 0)),
                        child: Slider(
                          value: value.currentDuration.inSeconds.toDouble(),
                          onChanged: (double double) {
                            // during when the user is sliding
                          },
                          onChangeEnd: (double double) {
                            // sliding has finished, to the  next position in song duration
                            value.seek(Duration(seconds: double.toInt()));
                          },
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          activeColor: Colors.green,
                        ),
                      )
                    ],
                  ),
                  // playback controls
                  Row(
                    children: [
                      // skip previous
                      PlayBackControls(
                        icon: Icons.skip_previous,
                        onTap: value.playPreviousSong,
                      ),

                      const SizedBox(width: 20),

                      // play and pause
                      PlayBackControls(
                        flex: 2,
                        icon: value.isPlaying ? Icons.pause : Icons.play_arrow,
                        onTap: value.pauseOrResume,
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      // skip next
                      PlayBackControls(
                        icon: Icons.skip_next,
                        onTap: value.playNextSong,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
