class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_arm64.tar.gz"
      sha256 "99248ae3c3684842ec543393d427867aa185e3e3a6a2ee1555f83231a743980a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_amd64.tar.gz"
      sha256 "419db3ee6b659654b30cbf18e17e11cbd47d340485ba5341c7153a064829c61a"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_arm64.tar.gz"
      sha256 "a4444a2706a2f190bcbc0cda2253b5a288f80adfaa085a95b5aa154405f0a2c6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_amd64.tar.gz"
      sha256 "bac6ee9605e703ee9f5eb190c09104b75bb648d99fd46592d3ec109b36d99304"
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
