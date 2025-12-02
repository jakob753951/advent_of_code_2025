import day_01/models
import day_01/parsing
import gleam/int
import gleam/list

pub fn apply_instruction(
  dial: models.Dial,
  instruction: models.Instruction,
) -> models.Dial {
  let rotated = case instruction.direction {
    models.Left -> dial - instruction.distance
    models.Right -> dial + instruction.distance
  }

  let assert Ok(new_value) = rotated |> int.modulo(by: 100)

  new_value
}

fn get_zeroes(
  start_position: models.Dial,
  instructions: List(models.Instruction),
) -> Int {
  instructions
  |> list.scan(start_position, apply_instruction)
  |> list.count(fn(dial) { dial == 0 })
}

pub fn solve(input: String) -> Int {
  let instructions = parsing.parse_instructions(input)
  let zeroes = get_zeroes(50, instructions)
  zeroes
}
