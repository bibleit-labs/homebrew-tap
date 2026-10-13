class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.6/bibleit_0.0.6_darwin_arm64.tar.gz"
      sha256 "fac6a88db00792e27ec8be22ff2dcca1f0ae51cd4b95d346faad13a833b29c93"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.6/bibleit_0.0.6_darwin_amd64.tar.gz"
      sha256 "f68c4a642fe13232e8e2fe47f909bac2f31047ad9cc3213554a90d7dca7bb216"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.6/bibleit_0.0.6_linux_arm64.tar.gz"
      sha256 "6544677650eb30eeede823750463ea4373a1366473e24852d32995dcc559c447"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.6/bibleit_0.0.6_linux_amd64.tar.gz"
      sha256 "71e220fd25e2fe4c18561aef6511423431ddf46c90974bf5ba9af9a6bb760abd"
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
