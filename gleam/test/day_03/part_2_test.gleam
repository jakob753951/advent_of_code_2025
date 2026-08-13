import day_03/models/bank
import day_03/part_2
import gleam/list
import gleam/result

pub fn get_joltage_test() {
  let cases = [
    #("987654321111111", 987_654_321_111),
    #("811111111111119", 811_111_111_119),
    #("234234234234278", 434_234_234_278),
    #("818181911112111", 888_911_112_111),
  ]
  cases
  |> list.each(fn(c) {
    assert c.0
      |> bank.parse
      |> result.map(part_2.get_joltage(_, 12))
      |> result.flatten
      == Ok(c.1)
  })
}

pub fn solve_test() {
  let input =
    "987654321111111\n811111111111119\n234234234234278\n818181911112111"

  assert part_2.solve(input) == Ok(3_121_910_778_619)
}
