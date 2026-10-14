class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.7/bibleit_0.0.7_darwin_arm64.tar.gz"
      sha256 "9d8d26a01d523f1bc5e1f951517f36718c2a39fc4cb2e7fc97a98a1d2d5932f6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.7/bibleit_0.0.7_darwin_amd64.tar.gz"
      sha256 "0f9d3929642243c703b4ee7fea343fde9f39ddfa6e1821b13ccb5f8c435c81b1"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.7/bibleit_0.0.7_linux_arm64.tar.gz"
      sha256 "65eb5e2d7220f2fff6a37f3e9fb15b5ec0d336159c5bd7fea50b62c2de7d8a33"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.7/bibleit_0.0.7_linux_amd64.tar.gz"
      sha256 "6633ec89be39ca402f974145ec43350ab81f04e09b1b4fedde58bc31d031639b"
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
