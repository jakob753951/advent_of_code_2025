pub type Cell {
  Paper
  Empty
}

pub fn parse(s: String) -> Result(Cell, String) {
  case s {
    "@" -> Ok(Paper)
    "." -> Ok(Empty)
    a -> Error("Excpected a Cell of '#' or ' '. Found '" <> a <> "' instead")
  }
}

pub fn is_paper(cell: Cell) -> Bool {
  case cell {
    Paper -> True
    _ -> False
  }
}

pub fn is_empty(cell: Cell) -> Bool {
  case cell {
    Empty -> True
    _ -> False
  }
}
