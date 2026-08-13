import day_11/models/problem.{type Problem}
import gleam/dict
import gleam/int
import gleam/list

pub fn solve(problem: Problem) -> Int {
  find(problem, "you", "out")
}

pub fn find(in problem: Problem, from node: String, to target: String) -> Int {
  case node == target {
    True -> 1
    False -> {
      case problem |> dict.get(node) {
        Ok(connected_nodes) ->
          connected_nodes
          |> list.map(find(problem, _, target))
          |> int.sum()
        Error(_) -> 0
      }
    }
  }
}
