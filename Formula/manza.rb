# typed: false
# frozen_string_literal: true

class Manza < Formula
  desc "Command-line interface for the Manza API"
  homepage "https://github.com/getmanza/cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-arm64"
      sha256 "66dd5fefae228ad6a3b8a92dd6d59ae8adf5d00ee8573552a9c5359a40876710"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-x64"
      sha256 "6cfc861f17c01f4f06d07a024a574c457e6591115c039ceb597eb2f275a1c579"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-arm64"
      sha256 "ae938919d5d64488f8e892219c78660ab8d9245bbbfb2552afae327388eb8004"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-x64"
      sha256 "357ff8c6fb883b974f6ed88d8d6a2d04e49181be4d6563577802106c569ed313"
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
