import day_03/models
import gleam/int
import gleam/list
import gleam/string

pub fn parse_battery(input: String) -> models.Battery {
  let assert Ok(number) = int.parse(input)
  case 1 <= number && number <= 9 {
    True -> number
    False -> panic
  }
}

pub fn parse_bank(input: String) -> models.Bank {
  input |> string.to_graphemes |> list.map(parse_battery)
}

pub fn parse_banks(input: String) -> List(models.Bank) {
  input |> string.split("\n") |> list.map(parse_bank)
}
