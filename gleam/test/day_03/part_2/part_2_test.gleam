import day_03/parsing
import day_03/part_2/main
import gleam/list

pub fn get_joltage_test() {
  let cases = [
    #("987654321111111", 987_654_321_111),
    #("811111111111119", 811_111_111_119),
    #("234234234234278", 434_234_234_278),
    #("818181911112111", 888_911_112_111),
  ]
  assert cases
    |> list.all(fn(c) { c.0 |> parsing.parse_bank |> main.get_joltage() == c.1 })
}

pub fn solve_test() {
  let input =
    "987654321111111\n811111111111119\n234234234234278\n818181911112111"

  assert main.solve(input) == 3_121_910_778_619
}
