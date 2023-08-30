String formatNumber(num number) {
  String numberString = number.toString();
  String formattedString = '';

  int length = numberString.length;
  int count = 0;

  for (int i = length - 1; i >= 0; i--) {
    formattedString = numberString[i] + formattedString;
    count++;

    if (count == 3 && i > 0) {
      formattedString = ' $formattedString';
      count = 0;
    }
  }

  return formattedString;
}