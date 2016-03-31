class ActionsFactory {
  static func make() -> [Action] {
    return [Action](arrayLiteral: MoveForwardAction(),
        MoveBackwardAction(),
        TurnLeftAction(),
        TurnRightAction())
  }
}