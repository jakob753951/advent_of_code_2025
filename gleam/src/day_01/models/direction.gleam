pub type Direction {
  Right
  Left
}

pub fn parse(input: String) -> Result(Direction, String) {
  case input {
    "R" -> Ok(Right)
    "L" -> Ok(Left)
    other -> Error("Expected one of 'R', 'L'. Found '" <> other <> "',")
  }
}
