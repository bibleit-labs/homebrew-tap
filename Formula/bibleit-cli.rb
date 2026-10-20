class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.3/bibleit_0.2.3_darwin_arm64.tar.gz"
      sha256 "ac76a43a40f70120743027acba1b8c55717d0b49bf65213cc067af089dab3def"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.3/bibleit_0.2.3_darwin_amd64.tar.gz"
      sha256 "f8240bb7e3de174fa0558aea9791c25168da4288c7e5c4f73fffb516336d6fdd"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.3/bibleit_0.2.3_linux_arm64.tar.gz"
      sha256 "9ad3ce2ea4610371fb01dcf0b1a39231b38007e01ca60059dea0aaba80949bf2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.3/bibleit_0.2.3_linux_amd64.tar.gz"
      sha256 "3801749d2cdf45ef793e6569c016f3332e24cc6e592313a2def8427c0071873d"
    end
  end
  def install
    bin.install "bibleit"
    pkgshare.install "LICENSE", "THIRD_PARTY_NOTICES"
    bash_completion.install "completions/bibleit.bash" => "bibleit"
    zsh_completion.install "completions/_bibleit"
    fish_completion.install "completions/bibleit.fish"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/bibleit version")
  end
end
