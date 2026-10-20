class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.2/bibleit_0.2.2_darwin_arm64.tar.gz"
      sha256 "a0f2b92b590ed7becf2e461de1d76fede86563fcebc10f77b1bc8fd133cab629"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.2/bibleit_0.2.2_darwin_amd64.tar.gz"
      sha256 "63a8fd6fa4985212d02290a11b5b3f8bb2ce7c25808837ad89bd2ce6dc9766ec"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.2/bibleit_0.2.2_linux_arm64.tar.gz"
      sha256 "e31f7a8e97aeb21badb1da2ebc1a4d7c6622040b54a95496c16e6acd09dd4e02"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.2/bibleit_0.2.2_linux_amd64.tar.gz"
      sha256 "35173e9dd180815f2ba4c3af67a19aea9de37753e8c833033b00e06a82ed6075"
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
