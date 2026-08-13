import day_11/models/problem
import day_11/part_2
import gleam/result

pub fn solve_example_test() {
  let example =
    "svr: aaa bbb
aaa: fft
fft: ccc
bbb: tty
tty: ccc
ccc: ddd eee
ddd: hub
hub: fff
eee: dac
dac: fff
fff: ggg hhh
ggg: out
hhh: out"
  let assert Ok(actual) =
    example
    |> problem.parse
    |> result.map(part_2.solve)
  assert actual == 2
}
