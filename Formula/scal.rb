class Scal < Formula
  desc "Rust implementation of the classic jcal utilities"
  homepage "https://github.com/arsalanyavari/scal"
  version "1.0.0"

  resource "man_pages" do
    url "https://github.com/arsalanyavari/scal/archive/afcaf79c764cd758b801d8144568f59afd987895.tar.gz"
    sha256 "71809a67b923b7d899d3390fc0a416199cb5a3b882647a1e9618ba0d7742ae97"
  end

  on_macos do
    on_arm do
      url "https://github.com/arsalanyavari/scal/releases/download/1.0.0/aarch64-apple-darwin.zip"
      sha256 "5737c63f63d604783ea7d52da6cb02b1f68dda29cc81a1dcbedf6722e89da385"
    end
    on_intel do
      url "https://github.com/arsalanyavari/scal/releases/download/1.0.0/x86_64-apple-darwin.zip"
      sha256 "da4cbdcee0cb2bd596b294bf676f7a033b637d934bdc8191619af682dcfd9002"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/arsalanyavari/scal/releases/download/1.0.0/aarch64-unknown-linux-gnu.zip"
      sha256 "bdb868daf9eb1f04c59393e710500bef62b36d5fc852cffd67eee2aa80b739ee"
    end
    on_intel do
      url "https://github.com/arsalanyavari/scal/releases/download/1.0.0/x86_64-unknown-linux-gnu.zip"
      sha256 "ab3a26f95775dcb282787fa19ce603b145fa5905b551072ff97c19a2e0ee2b2e"
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
