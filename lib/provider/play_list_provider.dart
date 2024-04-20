import 'package:audio_player/models/song.dart';
import 'package:flutter/material.dart';

class PlayListProvider extends ChangeNotifier {
  final List<Song> _playList = [
    Song(
        songName: "Emmanuel",
        artistName: "Gabriel Eziashi FT Henrisoul",
        albumImagePath: 'assets/images/phone.jpg',
        audioPath: 'assets/audio/Emmanuel.mp3'),
    Song(
        songName: "Consecrate my heart",
        artistName: "Victoria Orenze",
        albumImagePath: 'assets/images/samantha.jpg',
        audioPath: 'assets/audio/consecrate.mp3'),
    Song(
        songName: "Groanings",
        artistName: "Min.Theophilus Sunday",
        albumImagePath: 'assets/images/woman.jpg',
        audioPath: 'assets/audio/Oh_flesh.mp3'),
  ];

  // curent song index
  int? _currentSongIndex;

  /* 

 GETTERS

  */

  List<Song> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;
}
