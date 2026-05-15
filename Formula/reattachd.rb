class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.1.0/reattachd-darwin-aarch64.tar.gz"
      sha256 "73aafde84ccafe10f30c7806f7e6072a8c4298cf94c38d2c1362b874ce9fd2fe"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.1.0/reattachd-darwin-x86_64.tar.gz"
      sha256 "ca99f2bae695c3c847d1cd7aa58be9b9f4ceb348a8fb65e00c22c5d708a3bf07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.1.0/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "9db8f993200917c76210ca2415f7f11a0a46a65f8569849e2d3d1e33f25aff30"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.1.0/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "ce1756dcfa59d8194d2ea9fb405bffa88eda4362962c9d3014c342e1d93a1eb1"
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
