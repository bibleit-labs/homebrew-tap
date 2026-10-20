class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.1/bibleit_0.2.1_darwin_arm64.tar.gz"
      sha256 "657453158517412ddae1b3370c932fd938ac6128dae8dc9c0df744eeed278cc2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.1/bibleit_0.2.1_darwin_amd64.tar.gz"
      sha256 "de9d02babfa958caa7db773abb6928c24fe0d2e14cc5f27b2e621f15e99b990e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.1/bibleit_0.2.1_linux_arm64.tar.gz"
      sha256 "77b8b6177a8fa40fbdf86c56320e747dd99298fb0d1103658a751c4b26b7f9a3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.1/bibleit_0.2.1_linux_amd64.tar.gz"
      sha256 "791fbb251c85e39c2f27edbefce4f054496418f3edab903f443955fa30cd0764"
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
