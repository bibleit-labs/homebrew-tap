class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.4/bibleit_0.0.4_darwin_arm64.tar.gz"
      sha256 "020e70403319485dd31f2b3e10e1c1cfda9be8771cec2952781d79e451dbdb44"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.4/bibleit_0.0.4_darwin_amd64.tar.gz"
      sha256 "3c784f0b151b8310961446dccfbfd30db76e399c5fc41d61c1809217848f924b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.4/bibleit_0.0.4_linux_arm64.tar.gz"
      sha256 "8a14c564efd765f504cdf8e1fe5d0c8d41d840abb7f372c9a98e6acbfdeef7f7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.4/bibleit_0.0.4_linux_amd64.tar.gz"
      sha256 "370dedae0f7eb6f50a6ae5256b1b70d1c2d5ee2074468f210fae5856fd785bc1"
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
