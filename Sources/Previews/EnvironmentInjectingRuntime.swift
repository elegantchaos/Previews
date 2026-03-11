import SwiftUI

/// Runtime object that can inject its dependencies into SwiftUI content.
@MainActor
public protocol EnvironmentInjectingRuntime {
  /// Modifier that injects this runtime's environment values.
  associatedtype EnvironmentInjector: ViewModifier

  /// Modifier that applies the runtime's environment values.
  var environmentInjector: EnvironmentInjector { get }
}

public extension EnvironmentInjectingRuntime {
  /// Applies the runtime's environment values to the supplied content.
  func inject<Content: View>(_ content: Content) -> some View {
    content.modifier(environmentInjector)
  }
}
