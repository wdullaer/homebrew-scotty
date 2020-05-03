# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class Scotty < Formula
  desc "Scotty is a tool to rapidly switch to visited directories in your shell."
  homepage "https://github.com/wdullaer/scotty"
  version "v0.3.0"
  head "https://github.com/wdullaer/scotty.git"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/wdullaer/scotty/releases/download/v0.3.0/scotty-x86_64-apple-darwin.tar.gz"
    sha256 "c55d512cf3530a38573b89d0ff9ec32abee36f8922bd9addd9716d6bbeb03c27"
  elsif OS.linux?
    url "https://github.com/wdullaer/scotty/releases/download/v0.3.0/scotty-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5b989a53ec43974118ca772b87aa8f614f507a3fc1e8cb5e8a8630d6763e2052"
  end

  def install
    bin.install "scotty"
  end

  test do
    assert_equal "scotty v0.3.0", shell_output("#{bin}/scotty --version")
  end

end
