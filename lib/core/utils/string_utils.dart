extension StringExtensions on String {
  List<String> extractPhones() {
    // Define the regular expression pattern
    RegExp regex = RegExp(
        r'/+?\d{1,4}?[-.\s]?(?\d{1,3}?)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}/g');

    // Find all matches in the input string
    Iterable<Match> matches = regex.allMatches(this);

    // Extract and return the matched phones
    List<String> extractedPhones = [];
    for (Match match in matches) {
      extractedPhones.add(match.group(0)!);
    }

    return extractedPhones;
  }
}
