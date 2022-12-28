import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

const url1 = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3';
const url2 = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3';
const url3 = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3';

class AudioPlayerManager1 {
  final player = AudioPlayer();
  Stream<DurationState1>? durationState1;

  void init() {
    durationState1 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState1>(
        player.positionStream,
        player.playbackEventStream,
        (position, playbackEvent) => DurationState1(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
    player.setUrl(url1);
  }

  void dispose() {
    player.dispose();
  }
}

class DurationState1 {
  const DurationState1({
    required this.progress,
    required this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration? total;
}

class AudioPlayerManager2 {
  final player = AudioPlayer();
  Stream<DurationState2>? durationState2;

  void init() {
    durationState2 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState2>(
        player.positionStream,
        player.playbackEventStream,
            (position, playbackEvent) => DurationState2(
          progress: position,
          buffered: playbackEvent.bufferedPosition,
          total: playbackEvent.duration,
        ));
    player.setUrl(url2);
  }

  void dispose() {
    player.dispose();
  }
}

class DurationState2 {
  const DurationState2({
    required this.progress,
    required this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration? total;
}

class AudioPlayerManager3 {
  final player = AudioPlayer();
  Stream<DurationState3>? durationState3;

  void init() {
    durationState3 = Rx.combineLatest2<Duration, PlaybackEvent, DurationState3>(
        player.positionStream,
        player.playbackEventStream,
            (position, playbackEvent) => DurationState3(
          progress: position,
          buffered: playbackEvent.bufferedPosition,
          total: playbackEvent.duration,
        ));
    player.setUrl(url3);
  }

  void dispose() {
    player.dispose();
  }
}

class DurationState3 {
  const DurationState3({
    required this.progress,
    required this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration? total;
}