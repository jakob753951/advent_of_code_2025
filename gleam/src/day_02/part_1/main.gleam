import day_02/models
import day_02/parsing
import gleam/int
import gleam/list
import gleam/string

pub fn solve(input: String) -> Int {
  let ranges = parsing.parse_ranges(input)
  ranges
  |> list.map(invalid_ids_from_range)
  |> int.sum
}

pub fn invalid_ids_from_range(range: models.Range) -> Int {
  list.range(range.start, range.stop)
  |> list.filter(is_invalid)
  |> int.sum()
}

pub fn is_invalid(id: Int) -> Bool {
  let string_id = id |> int.to_string()
  let string_length = string_id |> string.length
  case { string_id |> string.length } % 2 {
    0 ->
      {
        string_id
        |> string.slice(0, string_length / 2)
        |> string.repeat(2)
      }
      == string_id

    _ -> False
  }
}
