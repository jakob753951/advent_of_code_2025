import day_11/models
import gleam/dict
import gleam/list
import gleam/result
import gleam/string

pub fn parse_problem(input: String) -> Result(models.Problem, Nil) {
  use nodes <- result.try(
    input
    |> string.split("\n")
    |> list.map(fn(line) {
      use #(label, connections) <- result.try(line |> string.split_once(": "))

      let connections =
        connections
        |> string.split(" ")

      Ok(#(label, connections))
    })
    |> result.all,
  )

  Ok(nodes |> dict.from_list)
}
