class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.1/reattachd-darwin-aarch64.tar.gz"
      sha256 "41892725ced7d24ec8ea2ce2a625341ba0ac3363a678c7fbb572364cd2d7cdc6"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.1/reattachd-darwin-x86_64.tar.gz"
      sha256 "4c9f483f9682de8b540556e20f1d250b6618562b29788b5ca2ef12d4822b4a30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.1/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "f97958e5988f666aa3dfd24b31cbb5430e85821a8fdc196f2b9af9e3ecd7c786"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.1/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "abd5fbad8debd7352c7d0da4580783d5116316265eecef89ffb14b7d732ba86b"
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
