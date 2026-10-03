# typed: false
# frozen_string_literal: true

class Manza < Formula
  desc "Command-line interface for the Manza API"
  homepage "https://github.com/getmanza/cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-arm64"
      sha256 "0123f76daa9199326fdff61dc4c3e74ff0bf14e927aca1c7fca6dda8c4d7f832"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-darwin-x64"
      sha256 "452b3f7f56e9dab7e3b6f1fb2a6a2af35dc274ef09723089773024cb95ba7972"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-arm64"
      sha256 "77575a39c1f86f7eb8ccaa335dac3e0c7eb9457c5290b5a569576df08c147cd0"
    end
    on_intel do
      url "https://github.com/getmanza/cli/releases/download/v#{version}/manza-linux-x64"
      sha256 "53c5055c18c7b532b986ebae338a70c88571fd82b628f350c69d0647be2a52d7"
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
