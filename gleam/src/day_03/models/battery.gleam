import gleam/int

pub type Battery =
  Int

pub fn parse(input: String) -> Battery {
  let assert Ok(number) = int.parse(input)
  case 1 <= number && number <= 9 {
    True -> number
    False -> panic
  }
}
