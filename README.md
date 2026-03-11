# Previews

`Previews` is a Swift package for building stable SwiftUI previews with seeded fixture data and runtime-driven environment injection.

## What It Provides

- `PreviewScenario` wraps the code that builds preview runtime state and fixture data.
- `PreviewBuilt` carries the built runtime and fixture into preview rendering.
- `PreviewRoot` builds a scenario once per host instance and injects the runtime into SwiftUI content.
- `EnvironmentInjectingRuntime` lets runtimes apply environment modifiers without global setup.

## Requirements

- Swift 6.2 or later
- Apple platforms declared in [Package.swift](Package.swift): macOS 26.0, iOS 26.0, tvOS 26.0

## Example

```swift
import SwiftUI
import Previews

struct DemoRuntime: EnvironmentInjectingRuntime {
  var environmentInjector: some ViewModifier {
    EmptyModifier()
  }
}

#Preview {
  PreviewRoot(
    PreviewScenario {
      PreviewBuilt(runtime: DemoRuntime(), fixture: "Hello")
    }
  ) { fixture in
    Text(fixture)
  }
}
```
