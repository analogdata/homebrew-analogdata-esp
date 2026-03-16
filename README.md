# homebrew-analogdata-esp

> Homebrew tap for [analogdata-esp](https://github.com/analogdata/analogdata-esp) — ESP-IDF CLI for embedded engineers.

---

## Install

```bash
brew tap analogdata/analogdata-esp
brew install analogdata-esp
```

Then verify your ESP-IDF environment is set up correctly:

```bash
analogdata-esp doctor
```

---

## What is analogdata-esp?

A CLI tool for ESP32 embedded engineers that gives you:

- **Project scaffolding** — `analogdata-esp new blink --target esp32s3` generates a complete project with `CMakeLists.txt`, starter C code, `.vscode/settings.json`, `.clangd`, and `.gitignore`
- **Build / Flash / Monitor** — `analogdata-esp build`, `analogdata-esp flash`, `analogdata-esp monitor`
- **AI assistant** — `analogdata-esp agent "why is my FreeRTOS task crashing"` — runs locally on Ollama (Gemma 3 4B) with Gemini/OpenAI/Anthropic fallback; auto-reads your build errors
- **Environment health check** — `analogdata-esp doctor` verifies your full IDF toolchain
- **Interactive shell** — run `analogdata-esp` with no arguments to open the REPL

---

## Requirements

- macOS (Apple Silicon or Intel)
- [ESP-IDF v5.x](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/) installed via the official installer

No Python required — this is a self-contained binary.

---

## Updating

```bash
brew upgrade analogdata-esp
```

---

## Source

- **CLI source:** [github.com/analogdata/analogdata-esp](https://github.com/analogdata/analogdata-esp)
- **This tap:** [github.com/analogdata/homebrew-analogdata-esp](https://github.com/analogdata/homebrew-analogdata-esp)
- **Homepage:** [analogdata.io](https://analogdata.io)

---

## For maintainers — releasing a new version

1. Build the release tarball from the main repo:
   ```bash
   cd analogdata-esp
   ./packaging/build_release.sh
   ```
2. Upload the `.tar.gz` to the [GitHub releases page](https://github.com/analogdata/analogdata-esp/releases)
3. Update `url` and `sha256` in `Formula/analogdata-esp.rb` (SHA256 is printed by the build script)
4. Commit and push this tap repo — users get the update via `brew upgrade`

---

MIT · [Analog Data](https://analogdata.io)
