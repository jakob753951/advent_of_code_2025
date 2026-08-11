import int_utils

pub fn range_1_to_5_test() {
  assert int_utils.range(1, 5) == [1, 2, 3, 4, 5]
}

pub fn range_5_to_1_test() {
  assert int_utils.range(5, 1) == [5, 4, 3, 2, 1]
}

pub fn range_minus_1_to_3() {
  assert int_utils.range(-1, 3) == [-1, 0, 1, 2, 3]
}

pub fn range_3_to_minus_1() {
  assert int_utils.range(3, -1) == [3, 2, 1, 0, -1]
}
