class SessionHub < Formula
  desc "Local batch manager for CLI conversation history"
  homepage "https://github.com/cola-runner/session-hub"
  url "https://github.com/cola-runner/session-hub/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "7165974bca6721dd8d5de57bdf536beff0887818a07a01d6d02383f34f6cf354"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]

    (bin/"session-hub").write <<~SH
      #!/usr/bin/env bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/src/cli.js" "$@"
    SH
  end

  test do
    assert_match "session-hub", shell_output("#{bin}/session-hub --help")
  end
end
