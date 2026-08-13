import day_01/models/dial.{type Dial}
import day_01/models/direction.{Left, Right}
import day_01/models/instruction.{Instruction}
import day_01/part_2

pub fn mini_test() {
  let dial: Dial = 11
  let instruction_1 = Instruction(Right, 8)
  let dial = #(dial, 0) |> part_2.apply_instruction(instruction_1)
  assert dial == #(19, 0)
  let instruction_2 = Instruction(Left, 19)
  let dial = dial |> part_2.apply_instruction(instruction_2)
  assert dial == #(0, 1)
}

pub fn wraps_left_test() {
  let dial: Dial = 0
  let instruction = Instruction(Left, 1)
  let dial = part_2.apply_instruction(#(dial, 0), instruction)
  assert dial == #(99, 0)
}

pub fn wraps_right_test() {
  let dial: Dial = 99
  let instruction = Instruction(Right, 1)
  let dial = part_2.apply_instruction(#(dial, 0), instruction)
  assert dial == #(0, 1)
}

pub fn solve_test() {
  let input = "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82"

  assert part_2.solve(input) == 6
}
