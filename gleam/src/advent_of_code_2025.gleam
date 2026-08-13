import day_04/part_2
import gleam/int
import gleam/io
import simplifile

pub fn main() -> Nil {
  let assert Ok(file_string) = simplifile.read("data/day_04.txt")
  let assert Ok(result) = part_2.solve(file_string)
  io.println(result |> int.to_string)
}
