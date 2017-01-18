#include <iostream>
#include <string>
#include <set>

bool isUnique(std::string str) {
  // O(n^2) = double loop
  // O(n log n) = sort and see if consecutive letters are same
  // O(n) = use set
  std::set<char> letters;
  for (int i = 0; i < str.length(); ++i) {
    std::set<char>::iterator it = letters.find(str[i]);
    if (it == letters.end()) { letters.insert(str[i]); }
    else { return false; }
  }
  return true;
}

int main() {
  std::cout << isUnique("abc") << std::endl;
  std::cout << isUnique("aba") << std::endl;
  return 0;
}
