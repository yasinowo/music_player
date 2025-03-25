import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/model/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _playlist = [
    // song 1
    Song(
      songName: "BAD FUNK",
      artistName: "SayFalse",
      albumArtImagePath: "assets/images/image1.jpg",
      audioPath: "assets/audio/BAD FUNK.mp3",
    ),
    // song 2
    Song(
      songName: "never meant to belong",
      artistName: "Shirō Sagisu",
      albumArtImagePath: "assets/images/image2.jpg",
      audioPath: "assets/audio/never meant to belong.mp3",
    ),
    // song 3
    Song(
      songName: "zahmat ha",
      artistName: "pishro",
      albumArtImagePath: "assets/images/pishro.jpg",
      audioPath: "assets/audio/zahmat.mp3",
    ),
  ];
  // current song playing index
  late int _currentSongIndex;

//AUDIOPLAYER
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }
  // initialliy not playing
  bool _isPlaying = false;

// play the song
  void play() async {
    final String path = _playlist[_currentSongIndex].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    notifyListeners();
  }

// pause current song
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
  // seek to a specific position in the current song
  // play next song
  // play previous song
  // list to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {});
  }
  // dispose audio plan
  /*
  GETTERS
    */

  List<Song> get playlist => _playlist;
  int get currentSongIndex => _currentSongIndex;

/*
  SETTERS
*/
  set currentSongIndex(int newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    // update UI
    notifyListeners();
  }
}
