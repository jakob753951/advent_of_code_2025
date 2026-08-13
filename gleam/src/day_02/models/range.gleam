import gleam/int
import gleam/result
import gleam/string

pub type Range {
  Range(start: Int, stop: Int)
}

pub fn parse(input: String) -> Result(Range, Nil) {
  use #(start, stop) <- result.try(input |> string.split_once(on: "-"))
  use start <- result.try(start |> int.parse)
  use stop <- result.try(stop |> int.parse)
  Ok(Range(start:, stop:))
}
