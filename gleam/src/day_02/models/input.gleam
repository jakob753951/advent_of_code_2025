import day_02/models/range.{type Range}
import gleam/list
import gleam/result
import gleam/string

pub fn parse(input: String) -> Result(List(Range), Nil) {
  input |> string.split(",") |> list.map(range.parse) |> result.all()
}
