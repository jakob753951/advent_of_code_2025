import day_01/models/instruction.{type Instruction}
import gleam/list
import gleam/result
import gleam/string

pub fn parse(file_string: String) -> Result(List(Instruction), String) {
  let lines = file_string |> string.split("\n")
  lines |> list.map(instruction.parse) |> result.all()
}
