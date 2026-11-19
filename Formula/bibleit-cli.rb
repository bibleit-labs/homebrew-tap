class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.3.0/bibleit_0.3.0_darwin_arm64.tar.gz"
      sha256 "d22bf2bfbc4da3ff95133f3066cfd4a9f1b41dca37108614abb83b5447d71d5d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.3.0/bibleit_0.3.0_darwin_amd64.tar.gz"
      sha256 "454352503525a687cb268de780d56ce544b48725234b270e028135377fb3228e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.3.0/bibleit_0.3.0_linux_arm64.tar.gz"
      sha256 "1d1f3e95c7333e23acd84b4b28a20a2671920f191e7603d22b0a49b9b48bfb9f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.3.0/bibleit_0.3.0_linux_amd64.tar.gz"
      sha256 "15a71c1e49117a69369203ecfd6c732ae43199ef8b6a167906b826ae68caa3fa"
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
