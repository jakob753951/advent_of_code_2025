import day_01/models/direction.{type Direction}
import gleam/int
import gleam/result
import gleam/string

pub type Instruction {
  Instruction(direction: Direction, distance: Int)
}

pub fn parse(input: String) -> Result(Instruction, String) {
  case input |> string.to_graphemes() {
    [] | [_] -> Error("Instructions must be at least 2 characters long.")
    [first, ..rest] -> {
      use direction <- result.try(direction.parse(first))
      let rest = rest |> string.join(with: "")
      use distance <- result.try(
        rest
        |> int.parse
        |> result.replace_error(
          "'" <> rest <> "' is not a valid number for rotation distance.",
        ),
      )

      Ok(Instruction(direction:, distance:))
    }
  }
}
