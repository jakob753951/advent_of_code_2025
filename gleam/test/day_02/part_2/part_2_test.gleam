import day_02/parsing
import day_02/part_2/main
import gleam/bool
import gleam/list

pub fn example_ranges_test() {
  let cases = [
    #("11-22", 11 + 22),
    #("95-115", 99 + 111),
    #("998-1012", 999 + 1010),
    #("1188511880-1188511890", 1_188_511_885),
    #("222220-222224", 222_222),
    #("1698522-1698528", 0),
    #("446443-446449", 446_446),
    #("38593856-38593862", 38_593_859),
    #("565653-565659", 565_656),
    #("824824821-824824827", 824_824_824),
    #("2121212118-2121212124", 2_121_212_121),
  ]

  assert cases
    |> list.all(fn(p) {
      p.0 |> parsing.parse_range |> main.invalid_ids_from_range == p.1
    })
}

pub fn single_digit_is_not_invalid_test() {
  assert 1 |> main.is_invalid |> bool.negate
}

pub fn solve_test() {
  let input =
    "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

  assert main.solve(input) == 4_174_379_265
}
