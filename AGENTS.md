# AGENTS.md

## Project Specific Rules

- This repository is a SwiftPM library package for SwiftUI preview infrastructure.
- It is intended to reduce boilerplate and improve stability for preview code by providing a structured way to build runtime state and fixture data.

## Standard Rules

Apply these compact rules by default:

- Follow KISS, YAGNI, DRY, explicit contracts, and structured concurrency. See [Extras/Documentation/Guidelines/Principles.md](Extras/Documentation/Guidelines/Principles.md).
- Keep code minimal, correct, tested, and aligned with current behavior. See [Extras/Documentation/Guidelines/Good Code.md](Extras/Documentation/Guidelines/Good%20Code.md).
- Inspect relevant code and docs before editing, then make the smallest coherent change set.
- Use red/green testing. Add or update focused tests for behavior changes. See [Extras/Documentation/Guidelines/Testing.md](Extras/Documentation/Guidelines/Testing.md).
- Keep comments concise and useful: document purpose, invariants, and non-obvious constraints; avoid restating symbol names.
- Prefer official Swift, SwiftPM, and Apple references for technical decisions. See [Extras/Documentation/Guidelines/Trusted Sources.md](Extras/Documentation/Guidelines/Trusted%20Sources.md).
- Follow modern Swift conventions for visibility, value semantics, error handling, and concurrency. See [Extras/Documentation/Guidelines/Swift.md](Extras/Documentation/Guidelines/Swift.md).
- Follow SwiftUI guidance for state, composition, and environment injection. See [Extras/Documentation/Guidelines/SwiftUI.md](Extras/Documentation/Guidelines/SwiftUI.md).
- Do not perform destructive actions or unrelated refactors without explicit approval.

To refresh this file, use the refresh-agents skill.
