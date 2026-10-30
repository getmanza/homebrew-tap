# typed: false
# frozen_string_literal: true

class Manza < Formula
  desc "Command-line interface for the Manza API"
  homepage "https://github.com/getmanza/cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-arm64"
      sha256 "1af4d28865bad71039b71bca7d40b742abe5a1c5d6806325292579bbcff33333"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-x64"
      sha256 "55b17958b06614354cfc2154eea161642d7bd566d852bb55313ae384eafc8131"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-arm64"
      sha256 "ea21d30b6eb1ea654c80b104d6821ea65489240d341f0a89e5257bb142124d62"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-x64"
      sha256 "8331fae56584743b42a4d2a57d969523495d0b3f053b7f504f3c490f0924e74b"
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
