class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.0/bibleit_0.2.0_darwin_arm64.tar.gz"
      sha256 "fed7e86299160c8351d1ebecefa3c64557913571f9ac97f0228e8699f527e98a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.0/bibleit_0.2.0_darwin_amd64.tar.gz"
      sha256 "cb9b5a28c9b0952053374e51007f0b5b85b7fc49f2fcd9b702cf708c58306cd0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.0/bibleit_0.2.0_linux_arm64.tar.gz"
      sha256 "d6dafcce15842874b2e4de2d029bb9c1c6d03be178bf5cfaa4d156842cdfeefe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.0/bibleit_0.2.0_linux_amd64.tar.gz"
      sha256 "63ef94c7ba8481ecd02e5a1a3e9e0fde7a7b5d0a0d66c4f143d368adc10c7bd5"
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
