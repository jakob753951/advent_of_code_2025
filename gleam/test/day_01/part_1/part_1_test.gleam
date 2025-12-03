import day_01/models
import day_01/part_1/main

pub fn mini_test() {
  let dial: models.Dial = 11
  let instruction_1 = models.Instruction(models.Right, 8)
  let dial = dial |> main.apply_instruction(instruction_1)
  assert dial == 19
  let instruction_2 = models.Instruction(models.Left, 19)
  let dial = dial |> main.apply_instruction(instruction_2)
  assert dial == 0
}

pub fn wraps_left_test() {
  let dial: models.Dial = 0
  let instruction = models.Instruction(models.Left, 1)
  let dial = main.apply_instruction(dial, instruction)
  assert dial == 99
}

pub fn wraps_right_test() {
  let dial: models.Dial = 99
  let instruction = models.Instruction(models.Right, 1)
  let dial = main.apply_instruction(dial, instruction)
  assert dial == 0
}

pub fn solve_test() {
  let input = "L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82"

  assert main.solve(input) == 3
}
