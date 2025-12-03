import day_03/models
import day_03/parsing
import gleam/int
import gleam/list

pub fn solve(input: String) -> models.Joltage {
  let banks = parsing.parse_banks(input)
  banks
  |> list.map(get_joltage)
  |> int.sum
}

pub fn get_joltage(bank: models.Bank) -> models.Joltage {
  let search_area = bank |> list.reverse |> list.drop(1) |> list.reverse
  let assert Ok(first_number) = search_area |> list.max(with: int.compare)
  let first_index = search_area |> index_of(first_number)
  let assert Ok(second_number) =
    bank |> list.drop(first_index + 1) |> list.max(with: int.compare)
  let joltage = first_number * 10 + second_number
  joltage
}

fn index_of(list: List(a), elem: a) -> Int {
  let assert Ok(found) =
    list |> enumerate |> list.find(fn(pair) { pair.0 == elem })
  found.1
}

fn enumerate(list: List(a)) -> List(#(a, Int)) {
  list.zip(list, list.range(0, { list |> list.length } - 1))
}
