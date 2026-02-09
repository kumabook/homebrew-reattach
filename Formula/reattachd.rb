class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.4/reattachd-darwin-aarch64.tar.gz"
      sha256 "110439464d484bf68420756c54a8d0eaf25174d6feda699df658109c8fb95303"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.4/reattachd-darwin-x86_64.tar.gz"
      sha256 "25ce5fa6a80c7047821f089dc4676d8dc3b24bdf9160cb064bb411545575d7b2"
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
    assert_match "reattachd", shell_output("#{bin}/reattachd --help")
  end
end
