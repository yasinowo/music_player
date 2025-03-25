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
  int? _currentSongIndex;

  /*
  GETTERS
    */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

/*
  SETTERS
*/
  set currentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    // update UI
    notifyListeners();
  }
}
