import day_02/models
import gleam/int
import gleam/list
import gleam/string

pub fn parse_ranges(input: String) -> List(models.Range) {
  input |> string.split(",") |> list.map(parse_range)
}

pub fn parse_range(input: String) -> models.Range {
  let assert Ok(#(start, stop)) = input |> string.split_once(on: "-")
  let assert Ok(start) = start |> int.parse
  let assert Ok(stop) = stop |> int.parse
  models.Range(start:, stop:)
}
