import 'package:audio_player/models/song.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayListProvider extends ChangeNotifier {
  final List<Song> _playList = [
    Song(
        songName: "Emmanuel",
        artistName: "Gabriel Eziashi FT Henrisoul",
        albumImagePath: 'assets/images/phone.jpg',
        audioPath: 'audio/Emmanuel.mp3'),
    Song(
        songName: "Consecrate my heart",
        artistName: "Victoria Orenze",
        albumImagePath: 'assets/images/samantha.jpg',
        audioPath: 'audio/consecrate.mp3'),
    Song(
        songName: "Oh flesh be gone away",
        artistName: "Min.Theophilus Sunday",
        albumImagePath: 'assets/images/woman.jpg',
        audioPath: 'audio/Oh_flesh.mp3'),
  ];

  // curent song index
  int? _currentSongIndex;

  /* 

  A U D I O P L A Y E R S

   */

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlayListProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playList[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop the current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;

    notifyListeners();
  }

  // pause the current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;

    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;

    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playList.length - 1) {
        // go to the next song if it is not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it is the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() async {
    // if more than 2 seconds has passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    // if it's within first 2 seconds of the song, go to the previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to to last song
        currentSongIndex = _playList.length - 1;
      }
    }
  }

  // list to duration
  void listenToDuration() {
    // listen for the total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;

      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;

      notifyListeners();
    });

    //  listen for when song is completed
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose audio player

  /* 

 GETTERS

  */ 

  List<Song> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /* 

  SETTERS

   */

  set currentSongIndex(int? newIndex) {
    //  update the song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    notifyListeners();
  }
}
