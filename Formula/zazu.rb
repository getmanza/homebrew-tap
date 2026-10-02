# typed: false
# frozen_string_literal: true

class Zazu < Formula
  desc "Command-line interface for the Zazu API"
  homepage "https://github.com/getmanza/cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/zazu-darwin-arm64"
      sha256 "fd964371ee7f5b63eb6bc19ab9ade4aaf849f21cad069116c151cdf0c93f2149"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/zazu-darwin-x64"
      sha256 "33f8cdd2033b6416320972b73b7cfad77128d79ad54a3a0903dc422c2133cb35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/zazu-linux-arm64"
      sha256 "7b9a4423eebe338142fbfb8b4d170994b01fc148de36c1ce0ee36dcb943280c7"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/zazu-linux-x64"
      sha256 "055732ce2a0cddc4a0632c00014840b3eee3f204575d693263b37efb784ea095"
    end
  end

  def install
    binary = case
             when OS.mac? && Hardware::CPU.arm? then "zazu-darwin-arm64"
             when OS.mac? && Hardware::CPU.intel? then "zazu-darwin-x64"
             when OS.linux? && Hardware::CPU.arm? then "zazu-linux-arm64"
             when OS.linux? && Hardware::CPU.intel? then "zazu-linux-x64"
             end
    bin.install binary => "zazu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zazu --version")
  end
end
