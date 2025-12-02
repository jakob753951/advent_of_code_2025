pub type Dial =
  Int

pub type Direction {
  Right
  Left
}

pub type Instruction {
  Instruction(direction: Direction, distance: Int)
}
