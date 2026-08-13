import gleam/int
import gleam/result

pub type Battery =
  Int

pub fn parse(input: String) -> Result(Battery, Nil) {
  use number <- result.try(int.parse(input))
  case 1 <= number && number <= 9 {
    True -> Ok(number)
    False -> Error(Nil)
  }
}
