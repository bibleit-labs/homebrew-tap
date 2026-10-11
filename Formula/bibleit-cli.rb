class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_arm64.tar.gz"
      sha256 "e9d4518ab9733873cc80db725759b30c7368d79470f99e8e6372deef462d9ba6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_amd64.tar.gz"
      sha256 "0b07e16f6c26033ab7839e3c71205e68dcb330f598e0457222c979f6f81e482b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_arm64.tar.gz"
      sha256 "43a160113d756371cac42775a49261bedbb093de6b762930c9a7bb4853224bab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_amd64.tar.gz"
      sha256 "2ad8dcc960494a78af1d9bbf11c7f19338d32e2fc1c26dfa886ac00f02691d76"
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
