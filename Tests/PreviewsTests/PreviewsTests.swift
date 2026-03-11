import SwiftUI
import Testing

@testable import Previews

private struct MarkerModifier: ViewModifier {
  let value: String

  func body(content: Content) -> some View {
    content.accessibilityIdentifier(value)
  }
}

@MainActor
private final class TestRuntime: EnvironmentInjectingRuntime {
  let identifier: UUID
  let marker: String

  init(identifier: UUID = UUID(), marker: String = "marker") {
    self.identifier = identifier
    self.marker = marker
  }

  var environmentInjector: some ViewModifier {
    MarkerModifier(value: marker)
  }
}

@Test
@MainActor
func scenarioBuildReturnsConfiguredRuntimeAndFixture() {
  let runtime = TestRuntime()
  let scenario = PreviewScenario<TestRuntime, String> {
    PreviewBuilt(runtime: runtime, fixture: "fixture")
  }

  let built = scenario.build()

  #expect(built.runtime === runtime)
  #expect(built.fixture == "fixture")
}

@Test
@MainActor
func storageBuildsScenarioOnceAndKeepsStableRuntimeIdentity() {
  var buildCount = 0
  let scenario = PreviewScenario<TestRuntime, String> {
    buildCount += 1
    return PreviewBuilt(runtime: TestRuntime(), fixture: "fixture")
  }

  let storage = PreviewStorage(scenario: scenario)
  let firstRuntime = storage.built.runtime
  let secondRuntime = storage.built.runtime

  #expect(buildCount == 1)
  #expect(firstRuntime === secondRuntime)
  #expect(storage.built.fixture == "fixture")
}

@Test
@MainActor
func runtimeInjectionProducesModifiedContent() {
  let runtime = TestRuntime(marker: "injected")
  let injected = runtime.inject(Text("preview"))
  let reflectedType = String(reflecting: type(of: injected))

  #expect(reflectedType.contains("ModifiedContent"))
  #expect(reflectedType.contains("Text"))
}
