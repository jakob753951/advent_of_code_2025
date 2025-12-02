import day_01/models
import day_01/parsing
import gleam/int
import gleam/list
import gleam/pair
import gleam/result

pub fn apply_instruction(
  dial: #(models.Dial, Int),
  instruction: models.Instruction,
) -> #(models.Dial, Int) {
  let rotated = case instruction.direction {
    models.Left -> dial.0 - instruction.distance
    models.Right -> dial.0 + instruction.distance
  }

  let assert Ok(new_value) = rotated |> int.modulo(by: 100)
  let crossed_zero = case dial.0 > 0 && rotated <= 0 {
    True -> 1
    False -> 0
  }

  let assert Ok(times_crossed_zero) =
    rotated |> int.divide(100) |> result.map(int.absolute_value)
  // echo #(dial.0, rotated, times_crossed_zero + crossed_zero)
  #(new_value, times_crossed_zero + crossed_zero)
}

fn get_zeroes(
  start_position: models.Dial,
  instructions: List(models.Instruction),
) -> Int {
  let states =
    instructions
    |> list.scan(#(start_position, 0), apply_instruction)

  let zero_crossings =
    states
    |> list.map(pair.second)
    |> int.sum()

  zero_crossings
}

pub fn solve(input: String) -> Int {
  let instructions = parsing.parse_instructions(input)
  let zeroes = get_zeroes(50, instructions)
  zeroes
}
