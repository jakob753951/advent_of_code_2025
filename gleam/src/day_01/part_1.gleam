import day_01/models/dial.{type Dial}
import day_01/models/direction.{Left, Right}
import day_01/models/input
import day_01/models/instruction.{type Instruction}
import gleam/int
import gleam/list

pub fn apply_instruction(dial: Dial, instruction: Instruction) -> Dial {
  let rotated = case instruction.direction {
    Left -> dial - instruction.distance
    Right -> dial + instruction.distance
  }

  let assert Ok(new_value) = rotated |> int.modulo(by: 100)

  new_value
}

fn get_zeroes(start_position: Dial, instructions: List(Instruction)) -> Int {
  instructions
  |> list.scan(start_position, apply_instruction)
  |> list.count(fn(dial) { dial == 0 })
}

pub fn solve(input: String) -> Int {
  let assert Ok(instructions) = input.parse(input)
  let zeroes = get_zeroes(50, instructions)
  zeroes
}
