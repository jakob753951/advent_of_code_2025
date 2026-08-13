import day_03/models/bank.{type Bank}
import day_03/models/input
import day_03/models/joltage.{type Joltage}
import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import int_utils
import list_utils

pub fn solve(input: String) -> Joltage {
  let banks = input.parse(input)
  banks
  |> list.map(get_joltage(_, 12))
  |> result.all()
  |> result.unwrap([-1])
  |> int.sum
}

pub fn get_joltage(bank: Bank, max_digits: Int) -> Result(Joltage, Nil) {
  get_joltage_numbers(bank, max_digits)
  |> result.try(int_utils.undigits(_, 10))
}

pub fn get_joltage_numbers(
  bank: Bank,
  max_digits: Int,
) -> Result(List(Int), Nil) {
  use <- bool.guard(list.length(bank) < max_digits, Error(Nil))
  use <- bool.guard(max_digits < 1, Error(Nil))
  let search_area = bank |> drop_end(max_digits - 1)
  let assert Ok(first_number) = search_area |> list.max(with: int.compare)
  let first_index = bank |> list_utils.index_of(first_number)

  case get_joltage_numbers(bank |> list.drop(first_index + 1), max_digits - 1) {
    Ok(rest) -> Ok([first_number, ..rest])
    Error(_) -> Ok([first_number])
  }
}

fn drop_end(list: List(a), up_to up_to: Int) -> List(a) {
  list |> list.reverse |> list.drop(up_to) |> list.reverse
}
