class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.1/reattachd-darwin-aarch64.tar.gz"
      sha256 "b989297494231b7452f1647bff05e9cf8dc51a11bbe87165407b336a92f04035"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.1/reattachd-darwin-x86_64.tar.gz"
      sha256 "e1692f57794a738aa722d64ff0841bb43ad1f9d93482e36ee359df144280e807"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.1/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "3d0fe581e4204119088caf36666fb7d272180f718e9a517fcc2c11cad8e7f5ef"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.1/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "9e61260cac81f2bdfc90d30948bd4e9dbe1b50f2b209921eaf26cdffd61c2f01"
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
    environment_variables REATTACHD_PORT: "8787", REATTACHD_BIND_ADDR: "127.0.0.1"
  end

  test do
    assert_match "Remote control daemon for tmux sessions",
                 shell_output("#{bin}/reattachd --help")
  end
end
