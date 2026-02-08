class CodexHistory < Formula
  desc "Local batch manager for Codex conversation history"
  homepage "https://github.com/cola-runner/codex-history-manager"
  url "https://github.com/cola-runner/codex-history-manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "45c88f360272bd7977cf29c73df3b891d3821479c5ce2ba5afbe4d284169a4d5"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]

    (bin/"codex-history").write <<~SH
      #!/usr/bin/env bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/src/cli.js" "$@"
    SH
  end

  test do
    assert_match "codex-history", shell_output("#{bin}/codex-history --help")
  end
end
