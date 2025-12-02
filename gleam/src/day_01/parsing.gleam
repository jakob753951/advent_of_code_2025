import day_01/models
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn parse_instructions(file_string: String) -> List(models.Instruction) {
  let lines = file_string |> string.split("\n")
  lines |> list.map(parse_line)
}

fn parse_line(line: String) -> models.Instruction {
  let direction = case line {
    "R" <> _ -> models.Right
    "L" <> _ -> models.Left
    _ -> panic
  }
  let assert Ok(rest) =
    line
    |> string.to_graphemes
    |> list.rest
    |> result.map(string.join(_, with: ""))
  let assert Ok(distance) = rest |> int.parse

  models.Instruction(direction:, distance:)
}
