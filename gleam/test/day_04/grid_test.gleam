import day_04/models/grid

pub fn get_neighbors_test() {
  let grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ]

  assert grid |> grid.get_neighbors(#(0, 0)) == [2, 4, 5]
  assert grid |> grid.get_neighbors(#(1, 0)) == [1, 3, 4, 5, 6]
  assert grid |> grid.get_neighbors(#(2, 0)) == [2, 5, 6]
  assert grid |> grid.get_neighbors(#(0, 1)) == [1, 2, 5, 7, 8]
  assert grid |> grid.get_neighbors(#(1, 1)) == [1, 2, 3, 4, 6, 7, 8, 9]
  assert grid |> grid.get_neighbors(#(2, 1)) == [2, 3, 5, 8, 9]
  assert grid |> grid.get_neighbors(#(0, 2)) == [4, 5, 8]
  assert grid |> grid.get_neighbors(#(1, 2)) == [4, 5, 6, 7, 9]
  assert grid |> grid.get_neighbors(#(2, 2)) == [5, 6, 8]
}
