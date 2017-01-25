#include <iostream>
#include <string>
#include <set>
#include <map>
using namespace std;

// ---------------------------------------------------------------------------//
// ---------------------------------------------------------------------------//
// ---------------------------Strings and Arrays------------------------------//
// ---------------------------------------------------------------------------//
// ---------------------------------------------------------------------------//

bool isUnique(string str) {
  // O(n^2) = double loop
  // O(n log n) = sort and see if consecutive letters are same
  // O(n) = use set
  set<char> letters;
  for (int i = 0; i < str.length(); ++i) {
    set<char>::iterator it = letters.find(str[i]);
    if (it == letters.end()) { letters.insert(str[i]); }
    else { return false; }
  }
  return true;
}

void handle_mapping(map<char, int> &m, string s) {
  for (int i = 0; i < s.length(); ++i) {
    if (s[i] == ' ') {
      continue;
    }
    map<char, int>::iterator it;
    it = m.find(s[i]);
    if (it == m.end()) {
      m[s[i]] = 1;
    }
    else {
      m[s[i]] += 1;
    }
  }
  return;
}

bool map_compare (map<char, int> const &lhs, map<char, int> const &rhs) {
    return lhs.size() == rhs.size() && equal(lhs.begin(), lhs.end(), rhs.begin());
}

bool is_permutation(string s1, string s2) {
  if (s1.length() != s2.length()) { return false; }
  map<char, int> m1;
  map<char, int> m2;
  handle_mapping(m1, s1);
  handle_mapping(m2, s2);
  return map_compare(m1, m2);
}

string urlify(string url) {
  string result = "";
  for (int i = 0; i < url.length(); i++) {
    if (url[i] == ' ') {
      result += "%20";
    }
    else {
      result += url[i];
    }
  }
  return result;
}

bool palindrome_permutation(string str) {
  map<char, int> letters;
  handle_mapping(letters, str);
  bool single = false;
  for (int i = 0; i < str.length(); ++i) {
    if (letters[str[i]] % 2 != 0 && single) {
      return false;
    }
    else if (letters[str[i]] % 2 != 0) {
      single = true;
    }
  }
  return true;
}

bool one_letter_diff(string s1, string s2) {
  bool trigger = false;
  for (int i = 0; i < s1.length(); ++i) {
    if (s1[i] != s2[i]) {
      if (trigger) { return false; }
      else { trigger = true; }
    }
  }
  return true;
}

bool extra_letter_check(string s1, string s2) {
  if (s1.length() > s2.length()) { swap(s1, s2); }
  string::iterator it = s1.begin();
  string::iterator ij = s2.begin();
  while (it != s1.end() && ij != s2.end()){
    // if iterators don't match, increase the longer one, then they should match
    // what about where the extra letter is at the end?
  }
  return true;
}

bool one_away(string s1, string s2) {
  int diff = s1.length() - s2.length();
  if (diff < 0) { diff *= -1; }
  if (diff > 1) { return false; }
  if (diff == 0) { return one_letter_diff(s1, s2); }
  else { return extra_letter_check(s1, s2); }
}

int main() {
  string s1 = "abc";
  string s2 = "abcd";
  cout << one_away(s1, s2) << endl;
  return 0;
}
