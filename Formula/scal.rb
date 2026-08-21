class Scal < Formula
  desc "Rust implementation of the classic jcal utilities"
  homepage "https://github.com/arsalanyavari/scal"
  version "1.1.0"

  resource "man_pages" do
    url "https://github.com/arsalanyavari/scal/archive/refs/tags/1.1.0.tar.gz"
    sha256 "bab96fbabf7548386d9b3fda0cdbc9ebfb84891ceda9de257259f3bd1309e32a"
  end

  on_macos do
    on_arm do
      url "https://github.com/arsalanyavari/scal/releases/download/1.1.0/aarch64-apple-darwin.zip"
      sha256 "d35dca8413a1b3ceb430a85477d26feec63b6afe6d31cd1e651ea05972039232"
    end
    on_intel do
      url "https://github.com/arsalanyavari/scal/releases/download/1.1.0/x86_64-apple-darwin.zip"
      sha256 "3dd357a19619301c0190aa8dfbe013aa87efa334bd21d308b28c6404693806bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/arsalanyavari/scal/releases/download/1.1.0/aarch64-unknown-linux-gnu.zip"
      sha256 "450c3c240880134a1220819311b2edcb873acde1cfbe50c9b6322a4c7e8b1dba"
    end
    on_intel do
      url "https://github.com/arsalanyavari/scal/releases/download/1.1.0/x86_64-unknown-linux-gnu.zip"
      sha256 "d480d6c2693719a1a29c17653bb2eda5cc29e10f798f4a763f3376d8bf1eeaaa"
    end
  end

  def install
    bin.install "scal"
    bin.install "sdate"
    bin.install "sstat"

    resource("man_pages").stage do
      man1.install "man/scal.1.roff" => "scal.1"
      man1.install "man/sdate.1.roff" => "sdate.1"
      man1.install "man/sstat.1.roff" => "sstat.1"
      man3.install "man/slib.3.roff" => "slib.3"
    end
  end

  test do
    system "#{bin}/scal", "--version"
    system "#{bin}/sdate", "--version"
    system "#{bin}/sstat", "--version"
  end
end
