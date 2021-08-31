void print_full_word_inconsole(String words) {
  final pattern = RegExp(".{1,888}");
  pattern.allMatches(words).forEach((match) => print(match.group(0)));
}
