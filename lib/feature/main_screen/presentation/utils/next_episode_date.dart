import 'package:anime_app/feature/main_screen/domain/entities/anime_entity.dart';

String? getNextEpisodeDate(AnimeEntity anime) {
  if (anime.player?.episodeEntity == null ||
      anime.player!.episodeEntity!.isEmpty) {
    return null;
  }

  var episodes = anime.player?.episodeEntity?.values.toList();
  if (episodes!.isEmpty) return null;

  List<int> timestamps =
      episodes.map<int>((e) => e.createdTimestamp ?? 0).toList()..sort();

  if (timestamps.length < 2) {
    return null;
  }

  List<int> intervals = [];
  for (int i = 1; i < timestamps.length; i++) {
    intervals.add(timestamps[i] - timestamps[i - 1]);
  }
  int avgInterval =
      (intervals.reduce((a, b) => a + b) / intervals.length).round();

  DateTime lastEpisodeDate =
      DateTime.fromMillisecondsSinceEpoch(timestamps.last * 1000);
  final lastEpisodeDateWithInterval =
      lastEpisodeDate.add(Duration(seconds: avgInterval));
  final convertedDate =
      _convertDateToString(lastEpisodeDateWithInterval.toString());
  return convertedDate;
}

String? _convertDateToString(String? lastEpisodeDate) {
  if (lastEpisodeDate != null) {
    final day = lastEpisodeDate.substring(8, 10);
    final month =
        _convertMonthToString(int.tryParse(lastEpisodeDate.substring(5, 7)));
    return '$day $month';
  }
  return null;
}

String? _convertMonthToString(int? month) {
  switch (month) {
    case 01:
      return 'января';
    case 02:
      return 'февраля';
    case 03:
      return 'марта';
    case 04:
      return 'апреля';
    case 05:
      return 'мая';
    case 06:
      return 'июня';
    case 07:
      return 'июля';
    case 08:
      return 'августа';
    case 09:
      return 'сентября';
    case 10:
      return 'октября';
    case 11:
      return 'ноября';
    case 12:
      return 'декабря';
    default:
      return '';
  }
}
