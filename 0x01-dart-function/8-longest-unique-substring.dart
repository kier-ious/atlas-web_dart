String longestUniqueSubstring(String str) {
  int maxLength = 0;
  int start = 0;
  String longestSubstring = '';
  Map<String, int> lastIndex = {};

  for (int k = 0; k < str.length; k++) {
    if (lastIndex.containsKey(str[k]) && lastIndex[str[k]] ! >= start) {
      start = lastIndex[str[k]] ! + 1;
    }

    lastIndex[str[k]] = k;
    int currentLength = k - start + 1;

    if (currentLength > maxLength) {
      maxLength = currentLength;
      longestSubstring = str.substring(start, k + 1);
    }
  }

  return longestSubstring;
}
