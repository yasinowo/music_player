import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/model/playlist_provider.dart';
import 'package:music_player/theme/text_style.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // convert duration into min:sec
        String formatTime(Duration duration) {
          String twoDigitSeconds = duration.inSeconds.remainder(60).toString();
          String formattedTime =
              "${duration.inMinutes}:${twoDigitSeconds.padLeft(2, '0')}";
          return formattedTime;
        }

        // get playlist
        final playlist = value.playlist;

        // get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                child: Column(children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  // app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // back button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25.sp,
                        ),
                      ), // IconButton

                      // title
                      Text(
                        "P L A Y L I S T",
                        style: drawerStyle,
                      ),

                      // menu button
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 25.sp,
                        ),
                      ), // IconButton
                    ], // children
                  ), // Row
                  SizedBox(height: 30.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // album artwork
                      NeuBox(
                        child: Column(
                          children: [
                            // image
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                    width: 250.w,
                                    height: 230.h,
                                    child: Image.asset(
                                      currentSong.albumArtImagePath,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ), // ClipRRect

                            // song and artist name and icon
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // song and artist name
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(currentSong.songName,
                                          style: bodyMediumStyle),
                                      Text(
                                        currentSong.artistName,
                                        style: bodySmallStyle,
                                      ),
                                    ], // children
                                  ), // Column

                                  // heart icon
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                ], // children
                              ), // Row
                            ), // Padding
                          ], // children
                        ), // Column
                      ), // NeuBox

                      SizedBox(height: 25.h),

                      // song duration progress
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // start time
                                Text(formatTime(value.currentDuration)),

                                // shuffle icon
                                Icon(Icons.shuffle),

                                // repeat icon
                                Icon(Icons.repeat),

                                // end time
                                Text(formatTime(value.totalDuration)),
                              ], // children
                            ), // Row
                          ), // Padding

                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 2)),
                            child: Slider(
                              min: 0,
                              max: value.totalDuration.inSeconds.toDouble(),
                              value: value.currentDuration.inSeconds.toDouble(),
                              activeColor: Colors.green,
                              onChanged: (double double) {
                                // during when the user is sliding around
                              },
                              onChangeEnd: (double double) {
                                // sliding has finished, go to that position in song duration
                                value.seek(Duration(seconds: double.toInt()));
                              },
                            ),
                          ), // Slider
                        ], // children
                      ), // Column
                      SizedBox(height: 15.h),
                      // playback controls
                      Row(
                        children: [
                          // skip previous
                          Expanded(
                            child: GestureDetector(
                              onTap: value.playPreviousSong,
                              child: const NeuBox(
                                child: Icon(Icons.skip_previous),
                              ), // NeuBox
                            ), // GestureDetector
                          ), // Expanded
                          SizedBox(
                            width: 15.w,
                          ),
                          // play pause
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: value.pauseOrResume,
                              child: NeuBox(
                                child: Icon(value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow),
                              ), // NeuBox
                            ), // GestureDetector
                          ), // Expanded
                          SizedBox(
                            width: 15.w,
                          ),
                          // skip forward
                          Expanded(
                            child: GestureDetector(
                              onTap: value.playNextSong,
                              child: NeuBox(
                                child: Icon(Icons.skip_next),
                              ), // NeuBox
                            ), // GestureDetector
                          ), // Expanded
                        ], // children
                      ), // Row]),
                    ], // Column
                  ),
                ]),
              ), // Scaffold
            ));
      },
    );
  }
}
