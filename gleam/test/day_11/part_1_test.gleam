import day_11/parsing
import day_11/part_1
import gleam/dict
import gleam/result

pub fn parsing_example_test() {
  let example =
    "aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out"

  let expected =
    [
      #("aaa", ["you", "hhh"]),
      #("you", ["bbb", "ccc"]),
      #("bbb", ["ddd", "eee"]),
      #("ccc", ["ddd", "eee", "fff"]),
      #("ddd", ["ggg"]),
      #("eee", ["out"]),
      #("fff", ["out"]),
      #("ggg", ["out"]),
      #("hhh", ["ccc", "fff", "iii"]),
      #("iii", ["out"]),
    ]
    |> dict.from_list

  let assert Ok(actual) = example |> parsing.parse_problem()

  assert actual == expected
}

pub fn solve_example_test() {
  let example =
    "aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out"
  let assert Ok(actual) =
    example
    |> parsing.parse_problem
    |> result.map(part_1.solve)
  assert actual == 5
}
