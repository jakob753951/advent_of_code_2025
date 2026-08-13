import day_11/models/node_id.{type NodeId}
import gleam/dict.{type Dict}
import gleam/list
import gleam/result
import gleam/string

pub type Problem =
  Dict(NodeId, List(NodeId))

pub fn parse(input: String) -> Result(Problem, Nil) {
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

  nodes |> dict.from_list |> Ok
}
