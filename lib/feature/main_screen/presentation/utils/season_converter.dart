String convertSeason(String? season, int year) {
  if (season == null) {
    return '$year год';
  } else {
    return '$season $year года';
  }
}