bool isPalindrome(String s) {
  if (s.length < 3) {
    return false;
  }

  String reversed = s.split('').reversed.join('');
  return s == reversed;
}

String longestPalindrome(String s) {
    if (s.length < 3) {
    return "none";
  }

  String longest = "";

  for (int k = 0; k < s.length; k++) {
    for (int j = k + 3; j <= s.length; j++) {
      String substring = s.substring(k, j);
      if (isPalindrome(substring) && substring.length > longest.length) {
        longest = substring;
      }
    }
  }

  return longest.isEmpty ? "none" : longest;
}
