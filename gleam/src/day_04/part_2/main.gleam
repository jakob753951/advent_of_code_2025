import day_04/models/cell.{type Cell}
import day_04/models/grid.{type Grid}
import gleam/list
import gleam/result

pub fn solve(input: String) -> Int {
  let grid =
    input
    |> grid.parse(cell.parse)
    |> result.unwrap([])

  remove_loop(grid, 0)
}

fn remove_loop(grid: Grid(Cell), acc: Int) -> Int {
  let #(grid, removed) = grid |> remove_papers()
  case removed {
    0 -> acc
    r -> remove_loop(grid, acc + r)
  }
}

fn remove_papers(grid: Grid(Cell)) -> #(Grid(Cell), Int) {
  let accessible_papers =
    grid
    |> grid.index_map(fn(pos, cell) {
      #(pos, cell, grid |> grid.get_neighbors(pos))
    })
    |> grid.map(fn(c) { #(c.0, c.1, c.2 |> list.count(cell.is_paper)) })
    |> list.flatten
    |> list.filter(fn(c) { c.2 < 4 })
    |> list.filter(fn(c) { c.1 == cell.Paper })
  let grid =
    grid
    |> set_indices(accessible_papers |> list.map(fn(c) { c.0 }), cell.Empty)
  #(grid, accessible_papers |> list.length())
}

fn set_indices(
  grid: Grid(cell),
  indices: List(#(Int, Int)),
  new_value: cell,
) -> Grid(cell) {
  list.fold(over: indices, from: grid, with: fn(grid, index) {
    grid |> grid.set_index(index, new_value)
  })
}
