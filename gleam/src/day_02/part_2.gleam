import day_02/models/input
import day_02/models/range.{type Range}
import gleam/int
import gleam/list
import gleam/string
import int_utils

pub fn solve(input: String) -> Int {
  let assert Ok(ranges) = input.parse(input)
  ranges
  |> list.map(invalid_ids_from_range)
  |> int.sum
}

pub fn invalid_ids_from_range(range: Range) -> Int {
  int_utils.range(range.start, range.stop)
  |> list.filter(is_invalid)
  |> int.sum()
}

pub fn is_invalid(id: Int) -> Bool {
  let string_id = id |> int.to_string()
  let string_length = string_id |> string.length
  let substr_lengths = int_utils.range(1, string_length / 2)

  substr_lengths
  |> list.any(fn(substr_length) {
    case string_length < 2, string_length % substr_length {
      False, 0 ->
        {
          string_id
          |> string.slice(0, substr_length)
          |> string.repeat(string_length / substr_length)
        }
        == string_id

      _, _ -> False
    }
  })
}
