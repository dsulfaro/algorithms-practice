describe("digitalRoot", function() {
  it("65,536 should return 7", function() {
    expect(Algorithms.digitalRoot(65536)).toBe(7);
  });

  it("1,853 should return 8", function() {
    expect(Algorithms.digitalRoot(1853)).toBe(8);
  });
});

describe("caesarCipher", function() {
  it("'hello' should return 'lipps'", function() {
    expect(Algorithms.caesarCipher('hello', 4)).toBe('lipps');
  });

  it("'abc' should return 'abc'", function() {
    expect(Algorithms.caesarCipher('abc', 26)).toBe('abc');
  });
});

describe("longestCommonSubstrings", function() {
  it("'Hello' and 'Hello World' should return 'Hello'", function() {
    expect(Algorithms.longestCommonSubstrings('Hello', 'Hello World')).toBe(5);
  });

  it("'ABABC' and 'BABCA' should return 'BABC'", function() {
    expect(Algorithms.longestCommonSubstrings('ABABC', 'BABCA')).toBe(4);
  });
});

describe("sumRec", function() {
  it("[1, 2, 3] should return 6", function() {
    expect(Algorithms.sumRec([1, 2, 3])).toBe(6);
  });

  it("[99, 66, 33] should return 198", function() {
    expect(Algorithms.sumRec([99, 66, 33])).toBe(198);
  });
});

describe("fibs", function() {
  it("3 should return [0, 1, 1]", function() {
    expect(Algorithms.fibs(3)).toEqual([0, 1, 1]);
  });

  it("5 should return [0, 1, 1, 2, 3]", function() {
    expect(Algorithms.fibs(5)).toEqual([0, 1, 1, 2, 3]);
  });
});

describe("isPalindrome", function() {
  it("'ricercar' should return false", function() {
    expect(Algorithms.isPalindrome('ricercar')).toBe(false);
  });

  it("'racecar' should return true", function() {
    expect(Algorithms.isPalindrome('racecar')).toBe(true);
  });
});

describe("foldingCipher", function() {
  it("'abcm' should return 'zyxn'", function() {
    expect(Algorithms.foldingCipher('abcm')).toBe('zyxn');
  });

  it("'zyxn' should return 'abcm'", function() {
    expect(Algorithms.foldingCipher('zyxn')).toBe('abcm');
  });
});

describe("uniqSubs", function() {
  it("should return all the substrings", function() {
    var array = ["a", "b", "c", "d", "ab", "bc", "cd", "abc", "bcd", "abcd"]
    expect(Algorithms.uniqSubs('abcd').sort()).toEqual(array.sort());
  });

  it("should not return repeats", function() {
    var array = ["d", "du", "dud", "dude", "u", "ud", "ude", "de", "e"]
    expect(Algorithms.uniqSubs('dude').sort()).toEqual(array.sort());
  });
});

describe("lcs", function() {
  it("should return the largest subsum", function() {
    var array = [4, -1, 5, 6, -13, 2]
    expect(Algorithms.lcs(array)).toBe(14);
  });

  it("should return the largest subsum", function() {
    var array = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    expect(Algorithms.lcs(array)).toBe(6);
  });
});

describe("sillyYears", function() {
  it("should return the ten subsequent silly years", function() {
    var array = [2307, 2417, 2527, 2637, 2747, 2857, 2967, 3406, 3516, 3626]
    expect(Algorithms.sillyYears(1978)).toEqual(array);
  });

  it("should return the ten subsequent silly years", function() {
    var array = [2417, 2527, 2637, 2747, 2857, 2967, 3406, 3516, 3626, 3736]
    expect(Algorithms.sillyYears(2307)).toEqual(array);
  });
});

describe("pairSum", function() {
  it("should return all the pairs that sum to 0", function() {
    var array = [[-1, 1]]
    expect(Algorithms.pairSum([1, 2, -1], 0)).toEqual(array);
  });

  it("should return all the pairs that sum to 1", function() {
    var array = [[-1, 2]]
    expect(Algorithms.pairSum([1, 2, -1, -1, -2], 1)).toEqual(array);
  });
});

describe("matrixRegionSum", function() {
  it("should return the sum of the elements within the coordinates", function() {
    var matrix = [[1, 2, 3], [2, 3, 4], [3, 4, 5]]
    var topLeftCoords = [0, 0]
    var bottomRightCoords = [1, 1]
    expect(Algorithms.matrixRegionSum(matrix, topLeftCoords, bottomRightCoords)).toBe(8);
  });

  it("should return the sum of the elements within the coordinates", function() {
    var matrix = [[2, 3, 4], [3, 4, 5], [4, 5, 6]]
    var topLeftCoords = [0, 0]
    var bottomRightCoords = [2, 2]
    expect(Algorithms.matrixRegionSum(matrix, topLeftCoords, bottomRightCoords)).toBe(36);
  });
});

describe("merge", function() {
  it("should correctly merge two arrays", function() {
    let arr1 = [1, 3];
    let arr2 = [2, 4];
    let result = [1, 2, 3, 4]
    expect(Algorithms.merge(arr1, arr2)).toEqual(result);
  });
  it("can handle cases of uneven arrays", function() {
    let arr1 = [5];
    let arr2 = [4, 6];
    let result = [4, 5, 6];
    expect(Algorithms.merge(arr1, arr2)).toEqual(result);
  });
  it("handles cases with duplicates", function() {
    let arr1 = [1, 2];
    let arr2 = [2, 3];
    let result = [1, 2, 2, 3];
    expect(Algorithms.merge(arr1, arr2)).toEqual(result);
  })
});

describe("merge_sort", function() {
  it("should correctly sort an array", function() {
    let shuffled = [4, 2, 1, 3, 5, 6];
    let array = [1, 2, 3, 4, 5, 6];
    expect(Algorithms.merge_sort(shuffled)).toEqual(array);
  });
});

describe("binary_search", function() {
  let array = [1, 2, 3, 4, 5];
  it("handles an easy search", function() {
    expect(Algorithms.binary_search(array, 3)).toBe(2);
  });
  it("handles the left correctly", function() {
    expect(Algorithms.binary_search(array, 1)).toBe(0);
  });
  it("handles the right correctly", function() {
    expect(Algorithms.binary_search(array, 4)).toBe(3);
  });
  it("handles a case where the number isn't there", function() {
    expect(Algorithms.binary_search(array, 1000)).toBe(null);
  });
});

describe("productify", function() {
  let array = [1, 2, 3, 4];
  it("returns an array with the correct values", function() {
    expect(Algorithms.productify(array)).toEqual([24, 12, 8, 6]);
  });
});

describe("subsets", function() {
  it("handles an empty case", function() {
    let array = [];
    expect(Algorithms.subsets(array)).toEqual([[]]);
  });
  it("handles a simple case", function() {
    let array = [1];
    expect(Algorithms.subsets(array)).toEqual([[], [1]]);
  });
  it("correctly returns subsets", function() {
    let array = [1, 2];
    expect(Algorithms.subsets(array)).toEqual([[], [2], [1], [1, 2]]);
  });
});
