class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_arm64.tar.gz"
      sha256 "59658e724ad2e0df4600dbfb7253faeb265772d25af620702bb0b8762864b33d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_amd64.tar.gz"
      sha256 "bb7f30afb207c4eb67b95235507b16589d5aeb9eb245808733fcdde87b657a71"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_arm64.tar.gz"
      sha256 "dc699c2d95515aa6f754ebe645b7d28dff0a3978186ac9f04bbbcdfd58640d74"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_amd64.tar.gz"
      sha256 "8545f5f41c5b3964b6e66376d2573e2c33a2abf5ef881f84ca1d754f6a39282e"
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
