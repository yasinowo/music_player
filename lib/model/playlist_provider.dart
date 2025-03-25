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
      audioPath: "audio/BAD FUNK.mp3",
    ),
    // song 2
    Song(
      songName: "never meant to belong",
      artistName: "Shirō Sagisu",
      albumArtImagePath: "assets/images/image2.jpg",
      audioPath: "audio/never meant to belong.mp3",
    ),
    // song 3
    Song(
      songName: "zahmat ha",
      artistName: "pishro",
      albumArtImagePath: "assets/images/pishro.jpg",
      audioPath: "audio/zahmat.mp3",
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
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

// seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

// play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex < _playlist.length - 1) {
        // go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex + 1;
      } else {
        // if it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

// play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      // restart the current song
      seek(Duration.zero);
    }
    // if it's within first 2 second of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

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
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
  // dispose audio plan
  /*
  GETTERS
    */

  List<Song> get playlist => _playlist;
  int get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

/*
  SETTERS
*/
  set currentSongIndex(int newIndex) {
    // update current song index
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); //play song at new index
    }

    // update UI
    notifyListeners();
  }
}
