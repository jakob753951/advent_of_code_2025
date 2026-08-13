import day_04/models/cell
import day_04/models/grid
import gleam/list
import gleam/pair
import gleam/result

pub fn solve(input: String) -> Result(Int, String) {
  use grid <- result.try(input |> grid.parse(cell.parse))

  let accessible_papers =
    grid
    |> grid.index_map(fn(pos, cell) { #(cell, grid |> grid.get_neighbors(pos)) })
    |> grid.map(fn(pair) {
      pair |> pair.map_second(list.count(_, cell.is_paper))
    })
    |> list.flatten
    |> list.filter(fn(pair) { pair |> pair.second() < 4 })
    |> list.filter(fn(pair) { pair |> pair.first() == cell.Paper })

  accessible_papers |> list.length() |> Ok
}
