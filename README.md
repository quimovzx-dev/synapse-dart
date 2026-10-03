# SYNAPSE 🎯

[![CI](https://github.com/quimovzx-dev/synapse-dart/actions/workflows/ci.yml/badge.svg)](https://github.com/quimovzx-dev/synapse-dart/actions/workflows/ci.yml) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A local Dart command-center CLI with JSON persistence for fast task capture, search and progress tracking.

## Features
- Persistent local `synapse.json` storage
- Add, list and complete tasks
- Full-text-ish case-insensitive task search
- Completion statistics
- Zero runtime dependencies

## Run
```bash
dart run bin/synapse.dart
```

Commands: `add <task>`, `list`, `done <id>`, `search <word>`, `stats`, `help`, `exit`.

## Quality
CI runs `dart analyze` and a CLI smoke test.

## License
MIT
