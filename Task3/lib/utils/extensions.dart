extension StringExtension on String {
  String capitalize() {
    String result = '';
    split(' ').forEach((element) {
      result += element[0].toUpperCase() + element.substring(1) + ' ';
    });
    return result.trim();
  }
}
