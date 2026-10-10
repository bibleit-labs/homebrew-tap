class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  version "0.1.0-dev.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0-dev.1/bibleit_0.1.0-dev.1_darwin_arm64.tar.gz"
      sha256 "e3d473413a1c7516ea41ae025738ac1de08017969980beb595cb79f2edb71ac3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0-dev.1/bibleit_0.1.0-dev.1_darwin_amd64.tar.gz"
      sha256 "3716409e680818dc9cb35cc47661b0f6d595f65f8e0137be5314e5420ef6eced"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0-dev.1/bibleit_0.1.0-dev.1_linux_arm64.tar.gz"
      sha256 "5b43c84a31af48d8ba05d8221aeb7b2194db342d0602323c88d214af09344e52"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.1.0-dev.1/bibleit_0.1.0-dev.1_linux_amd64.tar.gz"
      sha256 "f96711909a26c3f38552e7d99337273d0926db655c1d791a80572cbd0422d8b6"
    end
  end
  def install
    bin.install "bibleit"
    bash_completion.install "completions/bibleit.bash" => "bibleit"
    zsh_completion.install "completions/_bibleit"
    fish_completion.install "completions/bibleit.fish"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/bibleit version")
  end
end
