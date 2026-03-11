import SwiftUI

/// Runtime object that can inject its dependencies into SwiftUI content.
///
/// Conforming runtimes describe environment setup as a view modifier so previews stay declarative.
@MainActor
public protocol EnvironmentInjectingRuntime {
  /// Modifier that injects this runtime's environment values.
  associatedtype EnvironmentInjector: ViewModifier

  /// Modifier that applies the runtime's environment values.
  var environmentInjector: EnvironmentInjector { get }
}

extension EnvironmentInjectingRuntime {
  /// Applies the runtime's environment values to the supplied content.
  public func inject<Content: View>(_ content: Content) -> some View {
    content.modifier(environmentInjector)
  }
}
