import gleam/bool
import gleam/int
import gleam/list
import gleam/option.{type Option, None}

pub fn set_index(
  l: List(a),
  index: Int,
  new_value: a,
) -> Result(List(a), String) {
  let list_length = list.length(l)
  use <- bool.guard(index < 0, Error("index must be greater than 0"))
  use <- bool.guard(
    index >= list_length,
    Error(
      "index '"
      <> int.to_string(index)
      <> "' must be strictly less than the length of the list '"
      <> int.to_string(list_length)
      <> "'.",
    ),
  )

  l
  |> list.take(index)
  |> list.reverse
  |> list.fold(
    from: [new_value, ..l |> list.drop(index + 1)],
    with: list.prepend,
  )
  |> Ok
}

pub fn get_index(l: List(a), index: Int) -> Option(a) {
  use <- bool.guard(index < 0, None)
  use <- bool.guard(index >= list.length(l), None)
  l |> list.drop(index) |> list.first |> option.from_result()
}

pub fn index_of(list: List(a), elem: a) -> Int {
  let assert Ok(found) =
    list |> enumerate() |> list.find(fn(pair) { pair.0 == elem })
  found.1
}

fn enumerate(list: List(a)) -> List(#(a, Int)) {
  list |> list.index_map(fn(item, index) { #(item, index) })
}
