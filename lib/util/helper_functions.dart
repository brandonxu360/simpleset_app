String formatDateTime(DateTime date) {
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');
  String year =
      (date.year % 100).toString().padLeft(2, '0'); // Extract last two digits
  return '$month/$day/$year';
}

String formatWeight(double value) {
  if (value == value.round()) {
    return value
        .round()
        .toString(); // Display as integer if it's a whole number
  } else {
    return value.toStringAsFixed(1).replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
    // toStringAsFixed(1) ensures exactly one decimal place is shown
    // RegExp is used to remove trailing zeros after the decimal point
  }
}
