/// Result of building a preview scenario.
///
/// This value carries both the runtime used for environment injection and the fixture rendered by the preview.
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
