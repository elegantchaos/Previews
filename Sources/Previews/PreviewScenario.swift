/// Builder for a preview runtime and its fixture data.
@MainActor
public struct PreviewScenario<Runtime, Fixture> {
  /// Closure that builds the runtime and fixture.
  public let builder: () -> PreviewBuilt<Runtime, Fixture>

  /// Creates a scenario from a builder closure.
  public init(build builder: @escaping () -> PreviewBuilt<Runtime, Fixture>) {
    self.builder = builder
  }

  /// Builds the runtime and fixture for a preview instance.
  public func build() -> PreviewBuilt<Runtime, Fixture> {
    builder()
  }
}
