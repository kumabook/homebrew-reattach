class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "2.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.4/reattachd-darwin-aarch64.tar.gz"
      sha256 "c5ed902dff615fe6df0b6f0fb6ee66f40231b7a3ae920aa3b66a4366aec45ce3"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.4/reattachd-darwin-x86_64.tar.gz"
      sha256 "d80de643256a91666ccc2e4a15eec06e16e1d23c1e09911fac81cd59a6ccbf47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.4/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "c87fd5745b7b62d3dbfd47f52f8c2da98314b0e1d07c5ca970eef5d91108ded5"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.4/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "cacef44138e18d6aba9a1aa85b04370d6746c49263e8f07c960b8c52073ee4a4"
    end
  end

  def install
    bin.install "reattachd"
  end

  service do
    run [opt_bin/"reattachd"]
    keep_alive true
    log_path var/"log/reattachd.log"
    error_log_path var/"log/reattachd.error.log"
  end

  test do
    assert_match "Remote control daemon for tmux sessions",
                 shell_output("#{bin}/reattachd --help")
  end
end
