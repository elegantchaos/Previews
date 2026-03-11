import SwiftUI

/// SwiftUI host that builds preview state once and injects runtime environment.
@MainActor
public struct PreviewRoot<Runtime, Fixture, Content: View>: View where Runtime: EnvironmentInjectingRuntime {
  /// Content builder that renders the preview using the built fixture.
  public let content: (Fixture) -> Content

  @State private var storage: PreviewStorage<Runtime, Fixture>

  /// Creates a preview root for the supplied scenario.
  public init(
    _ scenario: PreviewScenario<Runtime, Fixture>,
    @ViewBuilder content: @escaping (Fixture) -> Content
  ) {
    self.content = content
    _storage = State(initialValue: PreviewStorage(scenario: scenario))
  }

  /// Rendered preview content with runtime environment applied.
  public var body: some View {
    storage.built.runtime.inject(content(storage.built.fixture))
  }
}

/// Persistent storage that ensures a preview scenario is built once per host instance.
@MainActor
final class PreviewStorage<Runtime, Fixture> {
  /// Built preview runtime and fixture.
  let built: PreviewBuilt<Runtime, Fixture>

  /// Builds and stores the supplied scenario.
  init(scenario: PreviewScenario<Runtime, Fixture>) {
    self.built = scenario.build()
  }
}
