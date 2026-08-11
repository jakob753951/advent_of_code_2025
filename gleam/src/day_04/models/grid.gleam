import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string
import int_utils
import list_utils

pub type Grid(cell) =
  List(List(cell))

pub fn get_cell(grid: Grid(cell), at indexes: #(Int, Int)) -> Option(cell) {
  let #(x, y) = indexes
  grid
  |> list_utils.get_index(y)
  |> option.map(fn(row) {
    row
    |> list_utils.get_index(x)
  })
  |> option.flatten()
}

pub fn set_index(
  grid: Grid(cell),
  index: #(Int, Int),
  new_value: cell,
) -> Grid(cell) {
  grid
  |> list_utils.set_index(
    index.1,
    grid
      |> list_utils.get_index(index.1)
      |> option.unwrap([])
      |> list_utils.set_index(index.0, new_value),
  )
}

pub fn get_neighbors(grid: Grid(cell), at indexes: #(Int, Int)) -> List(cell) {
  let y_indices = int_utils.range(from: -1, to: 1)
  let x_indices = int_utils.range(from: -1, to: 1)
  y_indices
  |> list.flat_map(fn(y_index) {
    x_indices
    |> list.map(fn(x_index) {
      let cell = grid |> get_cell(#(indexes.0 + x_index, indexes.1 + y_index))
      case x_index, y_index, cell {
        0, 0, _ -> None
        _, _, None -> None
        _, _, Some(cell) -> Some(cell)
      }
    })
    |> option.values
  })
}

pub fn map(grid: Grid(cell), mapper: fn(cell) -> new_cell) -> Grid(new_cell) {
  grid
  |> list.map(fn(row) { row |> list.map(mapper) })
}

pub fn index_map(
  grid: Grid(cell),
  mapper: fn(#(Int, Int), cell) -> out,
) -> Grid(out) {
  grid
  |> list.index_map(fn(row, y) {
    row |> list.index_map(fn(cell, x) { mapper(#(x, y), cell) })
  })
}

pub fn parse(
  s: String,
  parse_cell: fn(String) -> Result(cell, String),
) -> Result(Grid(cell), String) {
  let lines = s |> string.split("\n")
  let string_grid: Grid(String) = lines |> list.map(string.to_graphemes)
  string_grid
  |> map(parse_cell)
  |> list.map(result.all)
  |> result.all()
}
