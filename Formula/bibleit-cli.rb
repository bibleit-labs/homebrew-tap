class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.5/bibleit_0.0.5_darwin_arm64.tar.gz"
      sha256 "d33de0aab2205a47899aa10765dcffe98f7e0a306deb773f787496fdf11ec52b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.5/bibleit_0.0.5_darwin_amd64.tar.gz"
      sha256 "571d8620e729badbc3a7cd2474f5ec426e04f2fa6ddbdac1784d092d3e1c824e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.5/bibleit_0.0.5_linux_arm64.tar.gz"
      sha256 "4bdbcb18022dda75cdb16e9fea816badb185a32e4e7123b3cc8cca3e24f6d7ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.5/bibleit_0.0.5_linux_amd64.tar.gz"
      sha256 "493c3f9c225bbb4f8c26829ca5a3214d851b714f330acd943cdf5824d07837f6"
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
