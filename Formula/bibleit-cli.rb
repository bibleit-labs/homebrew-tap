class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0/bibleit_0.1.0_darwin_arm64.tar.gz"
      sha256 "de8f59519d0dacf44e740ea90fe57c52923879b55ca666813030c53039623b55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0/bibleit_0.1.0_darwin_amd64.tar.gz"
      sha256 "2ec79157dce3fc26eb36ada5e962860483904296f6852b13142c35cd864a5f69"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0/bibleit_0.1.0_linux_arm64.tar.gz"
      sha256 "15a9829f93f81a4cd161426bf45f9f0a8e55a063df98d1cdcfe811a2e24e5e52"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0/bibleit_0.1.0_linux_amd64.tar.gz"
      sha256 "cbbc440b16d992e73de8705306b0b7ffebe308171d58ff9b94d1bab23573b650"
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
