/// Result of building a preview scenario.
@MainActor
public struct PreviewBuilt<Runtime, Fixture> {
  /// Runtime used to inject environment for the preview.
  public let runtime: Runtime

  /// Seeded fixture data exposed to preview content.
  public let fixture: Fixture

  /// Creates a built preview value.
  public init(runtime: Runtime, fixture: Fixture) {
    self.runtime = runtime
    self.fixture = fixture
  }
}
