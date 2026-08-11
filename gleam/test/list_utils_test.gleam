import gleam/option.{Some}
import list_utils

pub fn get_index_test() {
  let test_list = [0, 0, 5, 0, 0, 0]
  assert test_list |> list_utils.get_index(2) == Some(5)
}

pub fn set_index_test() {
  let test_list = [1, 2, 3, 4, 5]
  assert test_list |> list_utils.set_index(2, 420) == [1, 2, 420, 4, 5]
}
