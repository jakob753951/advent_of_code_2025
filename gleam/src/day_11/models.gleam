import gleam/dict.{type Dict}

pub type NodeId =
  String

pub type Problem =
  Dict(NodeId, List(NodeId))
