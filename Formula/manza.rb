# typed: false
# frozen_string_literal: true

class Manza < Formula
  desc "Command-line interface for the Manza API"
  homepage "https://github.com/getmanza/cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-arm64"
      sha256 "dc4cbcf03f5241720e48e050902e91f5d81ee463c11e3494bdb98a93131d3e51"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-x64"
      sha256 "5383986ce649a27318d8705802b57e637e48cb29779d56e99c984c9f18336350"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-arm64"
      sha256 "f08494c3f3d4f9cce9ea7118790b6c8995ca9dc002f494675406a7d4be5ea223"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-x64"
      sha256 "be162a66b3c6afd6c7a9a526e3478001957cc7fadb6c007baaec5d32fcffc283"
    end
  end

  def install
    binary = case
             when OS.mac? && Hardware::CPU.arm? then "manza-darwin-arm64"
             when OS.mac? && Hardware::CPU.intel? then "manza-darwin-x64"
             when OS.linux? && Hardware::CPU.arm? then "manza-linux-arm64"
             when OS.linux? && Hardware::CPU.intel? then "manza-linux-x64"
             end
    bin.install binary => "manza"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/manza --version")
  end
end
