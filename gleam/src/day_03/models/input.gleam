import day_03/models/bank.{type Bank}
import gleam/list
import gleam/result
import gleam/string

pub fn parse(input: String) -> Result(List(Bank), Nil) {
  input |> string.split("\n") |> list.map(bank.parse) |> result.all()
}
