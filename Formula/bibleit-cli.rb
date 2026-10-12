class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.3/bibleit_0.0.3_darwin_arm64.tar.gz"
      sha256 "57c3ea300a90824f10e516a520521aca6543cd4dd5a6971699b08916f5d91bb6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.3/bibleit_0.0.3_darwin_amd64.tar.gz"
      sha256 "599c3fd0d4a75db12f411d6f7c26e69f2b4b875b5aeede153e231db6b10be171"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.3/bibleit_0.0.3_linux_arm64.tar.gz"
      sha256 "201cab58874af4195c5abaf0f4c16bbf6f26bfd7f0e48bd0a7a199a206ea62db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.3/bibleit_0.0.3_linux_amd64.tar.gz"
      sha256 "26e1b3730ddabeb308e6996a6aa92734b4f41eb531dbf963309dcbab54541caa"
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
