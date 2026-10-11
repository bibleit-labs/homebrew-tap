class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_arm64.tar.gz"
      sha256 "fe632e0f97203a921e6799199d93eba308b0c54803f266f4a2454458a4e3efc3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_darwin_amd64.tar.gz"
      sha256 "194714796862b162f65303b8a66cb62058bae9e328db0d596225518ff6b9993c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_arm64.tar.gz"
      sha256 "f5a29bf8ef1b2089fc9e1de8a9a8f5cdb789af0bac1cbe696e6985868237b10f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.2/bibleit_0.0.2_linux_amd64.tar.gz"
      sha256 "c392664adbdd4fd66c25bc72c0512d4eedba7ef18f3d901e98b005c2e224b38c"
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
