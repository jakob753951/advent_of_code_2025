import day_03/models/bank
import day_03/part_1
import gleam/list

pub fn get_joltage_test() {
  let cases = [
    #("987654321111111", 98),
    #("811111111111119", 89),
    #("234234234234278", 78),
    #("818181911112111", 92),
  ]
  cases
  |> list.each(fn(c) {
    assert c.0 |> bank.parse |> part_1.get_joltage() == c.1
  })
}

pub fn solve_test() {
  let input =
    "987654321111111\n811111111111119\n234234234234278\n818181911112111"

  assert part_1.solve(input) == 357
}
