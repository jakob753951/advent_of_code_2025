import day_04/models/cell.{type Cell}
import day_04/models/grid.{type Grid}
import gleam/list
import gleam/result

pub fn solve(input: String) -> Result(Int, String) {
  use grid <- result.try(input |> grid.parse(cell.parse))

  use removed_papers <- result.try(remove_papers_loop(grid, 0))
  Ok(removed_papers)
}

fn remove_papers_loop(grid: Grid(Cell), acc: Int) -> Result(Int, String) {
  use #(grid, removed) <- result.try(grid |> remove_papers())
  case removed {
    0 -> Ok(acc)
    r -> remove_papers_loop(grid, acc + r)
  }
}

fn remove_papers(grid: Grid(Cell)) -> Result(#(Grid(Cell), Int), String) {
  let accessible_papers =
    grid
    |> grid.index_map(fn(pos, cell) {
      #(pos, cell, grid |> grid.get_neighbors(pos))
    })
    |> grid.map(fn(c) { #(c.0, c.1, c.2 |> list.count(cell.is_paper)) })
    |> list.flatten
    |> list.filter(fn(c) { c.2 < 4 })
    |> list.filter(fn(c) { c.1 == cell.Paper })
  use grid <- result.try(
    grid
    |> set_indices(accessible_papers |> list.map(fn(c) { c.0 }), cell.Empty),
  )
  Ok(#(grid, accessible_papers |> list.length()))
}

fn set_indices(
  grid: Grid(cell),
  indices: List(#(Int, Int)),
  new_value: cell,
) -> Result(Grid(cell), String) {
  list.fold(over: indices, from: Ok(grid), with: fn(grid, index) {
    grid
    |> result.map(fn(grid) { grid |> grid.set_index(index, new_value) })
    |> result.flatten
  })
}
