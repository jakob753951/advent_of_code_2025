import day_03/models/bank.{type Bank}
import gleam/list
import gleam/string

pub fn parse(input: String) -> List(Bank) {
  input |> string.split("\n") |> list.map(bank.parse)
}
