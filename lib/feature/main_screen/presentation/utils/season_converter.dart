String convertSeason(String? season, String year) {
  if (season == null) {
    return '$year год';
  } else {
    return '$season $year года';
  }
}
