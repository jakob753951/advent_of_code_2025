import day_01/part_2/main
import gleam/int
import gleam/io
import simplifile

pub fn main() -> Nil {
  let assert Ok(file_string) = simplifile.read("data/day_01.txt")
  let result = main.solve(file_string)
  io.println(result |> int.to_string)
}
