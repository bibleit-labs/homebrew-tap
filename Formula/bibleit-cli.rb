class BibleitCli < Formula
  desc "Command-line client for Bibleit"
  homepage "https://github.com/bibleit-labs/bibleit-cli"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.1/bibleit_0.0.1_darwin_arm64.tar.gz"
      sha256 "8a25b1957ef1b358d7027ee3782122e53b7ebe1d685c756e7a609de7f865c942"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.1/bibleit_0.0.1_darwin_amd64.tar.gz"
      sha256 "319a9c4d24b2911fc4963600d18b86d080019af3d76c99b7fabad3b7752add7e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.1/bibleit_0.0.1_linux_arm64.tar.gz"
      sha256 "9a90adcc344bdd52e4868cbc78886b07cde0a0c05a161fb6ffeb2e5d5fce579a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibleit-labs/bibleit-cli/releases/download/v0.0.1/bibleit_0.0.1_linux_amd64.tar.gz"
      sha256 "4c9ecc4dcca075d202ad502c49e916440fd1a92f9c5cb2e55a32f92a9944b601"
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
