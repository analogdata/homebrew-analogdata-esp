# Homebrew formula for analogdata-esp
#
# This file is the source of truth for the tap formula.
# It lives in the main repo at packaging/homebrew/analogdata-esp.rb
#
# The PUBLISHED version lives in the tap repo:
#   https://github.com/analogdata/homebrew-tap
#   path: Formula/analogdata-esp.rb
#
# Users install with:
#   brew tap analogdata/tap
#   brew install analogdata-esp
#
# ── How to update after a new release ─────────────────────────────────────────
#   1. Run:  ./packaging/build_release.sh
#   2. Upload the .tar.gz to the GitHub release page
#   3. Copy the printed SHA256 into the sha256 field below
#   4. Update `url` and `version` to the new version
#   5. Copy this file into the tap repo:
#        cp packaging/homebrew/analogdata-esp.rb ../homebrew-tap/Formula/analogdata-esp.rb
#   6. Commit + push the tap repo
# ──────────────────────────────────────────────────────────────────────────────

class AnalogdataEsp < Formula
  desc "ESP-IDF project scaffolding and AI agent for embedded engineers"
  homepage "https://github.com/analogdata/analogdata-esp"
  version "0.2.0"
  license "MIT"

  # ── Platform-specific prebuilt tarballs ───────────────────────────────────
  # Each tarball contains the binary + _internal/ directory (onedir format).
  # No Python required on the user's machine.
  on_macos do
    if Hardware::CPU.arm?
      # Apple Silicon (M1/M2/M3/M4)
      url "https://github.com/analogdata/analogdata-esp/releases/download/v0.2.0/analogdata-esp-macos-arm64-v0.2.0.tar.gz"
      sha256 "a7c94baef46df49986cb708677731df4539e3b0a3f2280b9a335a72f01fc4f8e"
    else
      # Intel Mac
      url "https://github.com/analogdata/analogdata-esp/releases/download/v0.1.0/analogdata-esp-macos-x86_64-v0.1.0.tar.gz"
      sha256 "PLACEHOLDER_x86_64_SHA256"
    end
  end

  def install
    # Install the binary and its _internal/ dependency directory into libexec
    # so they stay co-located (PyInstaller onedir requires this).
    # bin.write_exec_script creates a shell wrapper in /usr/local/bin (or /opt/homebrew/bin)
    # that sets DYLD_LIBRARY_PATH and execs libexec/analogdata-esp.
    libexec.install "analogdata-esp", "_internal"
    bin.write_exec_script libexec/"analogdata-esp"
  end

  test do
    # Smoke test: the binary must print our brand name
    assert_match "Analog Data", shell_output("#{bin}/analogdata-esp --help")
  end
end
