import day_03/parsing
import day_03/part_2/main

pub fn get_joltage_test() {
  assert "987654321111111" |> parsing.parse_bank |> main.get_joltage(12)
    == Ok(987_654_321_111)
  assert "811111111111119" |> parsing.parse_bank |> main.get_joltage(12)
    == Ok(811_111_111_119)
  assert "234234234234278" |> parsing.parse_bank |> main.get_joltage(12)
    == Ok(434_234_234_278)
  assert "818181911112111" |> parsing.parse_bank |> main.get_joltage(12)
    == Ok(888_911_112_111)
}

pub fn solve_test() {
  let input =
    "987654321111111\n811111111111119\n234234234234278\n818181911112111"

  assert main.solve(input) == 3_121_910_778_619
}
