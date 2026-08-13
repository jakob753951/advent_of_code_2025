import day_03/models/battery.{type Battery}
import gleam/int
import gleam/result
import int_utils

pub type Bank =
  List(Battery)

pub fn parse(input: String) -> Result(Bank, Nil) {
  input
  |> int.parse()
  |> result.try(int_utils.digits(_, 10))
}
