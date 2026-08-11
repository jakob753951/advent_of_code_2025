import day_11/models
import day_11/part_1
import gleam/dict
import gleam/int
import gleam/list
import gleam/set.{type Set}

pub fn solve(problem: models.Problem) -> Int {
  let svr_fft = part_1.find(problem, from: "svr", to: "fft")
  let fft_dac = part_1.find(problem, from: "fft", to: "dac")
  let dac_out = part_1.find(problem, from: "dac", to: "out")

  let svr_dac = part_1.find(problem, from: "svr", to: "dac")
  let dac_fft = part_1.find(problem, from: "dac", to: "fft")
  let fft_out = part_1.find(problem, from: "fft", to: "out")

  svr_fft * fft_dac * dac_out + svr_dac * dac_fft * fft_out
  // find(
  //   problem,
  //   from: "svr",
  //   target: "out",
  //   through: set.from_list(["dac", "fft"]),
  // )
}

pub fn find(
  in problem: models.Problem,
  from node: String,
  target target: String,
  through checkpoints: Set(String),
) -> Int {
  case node == target, checkpoints |> set.is_empty {
    True, True -> 1
    True, False -> 0
    _, _ -> {
      let checkpoints = checkpoints |> set.delete(node)

      let assert Ok(connected_nodes) = problem |> dict.get(node)
      connected_nodes
      |> list.map(find(problem, _, target, checkpoints))
      |> int.sum()
    }
  }
}
