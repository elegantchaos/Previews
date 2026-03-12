# AGENTS.md

## Project Specific Rules

- This repository is a SwiftPM library for building stable SwiftUI preview infrastructure with runtime injection and seeded fixture data.

## Standard Rules

- Baseline shared guidance: ~/.local/share/agents/instructions/COMMON.md
- Core shared modules: ~/.local/share/agents/instructions/Principles.md, ~/.local/share/agents/instructions/Good Code.md, ~/.local/share/agents/instructions/Validation.md, ~/.local/share/agents/instructions/Trusted Sources.md
- Stack-specific shared guidance: ~/.local/share/agents/instructions/languages/Swift.md
- Shared skills for this stack: ~/.local/share/skills/validation-flow-skill/SKILL.md, ~/.local/share/skills/codex-git-skill/SKILL.md, ~/.local/share/skills/codex-github-skill/SKILL.md, ~/.local/share/skills/SwiftUI-Agent-Skill/swiftui-pro/SKILL.md, ~/.local/share/skills/Swift-Testing-Agent-Skill/swift-testing-pro/SKILL.md, ~/.local/share/skills/Swift-Concurrency-Agent-Skill/swift-concurrency-pro/SKILL.md
- Inspect relevant code and docs before editing. Prefer the smallest coherent change that fixes the root cause.
- Follow DRY and Single Source Of Truth. Prefer KISS, YAGNI, explicit contracts, composition, and structured concurrency.
- Keep interfaces explicit and intentionally small. Avoid hidden coupling, surprising side effects, unnecessary dependencies, and compatibility layers unless the user explicitly asks for them.
- Use red/green TDD for non-UI code.
- Create previews for UI code.
- Follow the validation workflow from ~/.local/share/agents/instructions/Validation.md and report every skipped or blocked check with the reason.
- Run validation relevant to the change. For this repository, use the narrowest checks first, then broaden to project-level checks such as swift build and swift test. Use the shared validation skill when it applies.
- Keep comments and docs concise and useful. Document purpose, contracts, and non-obvious constraints, and update docs when behavior changes.
- Prefer trusted primary sources for technical decisions. Start with Apple documentation, Swift documentation, Swift Evolution proposals, SwiftPM references, and first-party dependency documentation before secondary summaries.
- Do not perform destructive actions without explicit approval.
- If unexpected workspace changes appear, pause and confirm direction before proceeding.

To refresh this file, use the ~/.local/share/skills/refresh-agents-skill/SKILL.md skill.
