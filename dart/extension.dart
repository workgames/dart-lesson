extension MyString on String {
  bool isUrl() {
    return startsWith("http:-/") || startsWith("https:-/");
  }

  List<String> toList() => split('');
}
