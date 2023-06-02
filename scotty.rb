# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class Scotty < Formula
  desc "Scotty is a tool to rapidly switch to visited directories in your shell."
  homepage "https://github.com/wdullaer/scotty"
  version "v0.3.4"
  head "https://github.com/wdullaer/scotty.git"

  on_macos do
    on_arm do
      url "https://github.com/wdullaer/scotty/releases/download/v0.3.4/scotty-arm64-apple-darwin.tar.gz"
      sha256 "a69cff98c96c9e13c4287d84609b2f7aca321440441de57b7441a48459fce27b"
    end
    on_intel do
      url "https://github.com/wdullaer/scotty/releases/download/v0.3.4/scotty-x86_64-apple-darwin.tar.gz"
      sha256 "3030a3e98d609e53008d08a663d808e01aad6de30b0e58d0ed29fa3b25457355"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/wdullaer/scotty/releases/download/v0.3.4/scotty-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b5f20ff8d806717217b285a52bc7fb4305738e084ace7db36c98d4eb82e4407"
    end
  end

  def install
    bin.install "scotty"
  end

  test do
    assert_equal "scotty v0.3.4", shell_output("#{bin}/scotty --version")
  end

end
