class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.4/bibleit_0.2.4_darwin_arm64.tar.gz"
      sha256 "a56695fc0dac1b09ae272854ce9f55717fb97ab672efe99b64796318383581a1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.4/bibleit_0.2.4_darwin_amd64.tar.gz"
      sha256 "97e967d832ad0023ebdd84deed9d8e59e74d52db5f99631fc9c6cfa99e0de7bb"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.4/bibleit_0.2.4_linux_arm64.tar.gz"
      sha256 "0175343f0b907ad0320ccc184e0a2caa4727742f6a0676b6505606ad4158a85b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.2.4/bibleit_0.2.4_linux_amd64.tar.gz"
      sha256 "53459d6fc714e5fb7727ef8ee4e44f0c1392377674e8fd1069e2984948971f5c"
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
