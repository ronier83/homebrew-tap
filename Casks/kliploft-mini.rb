cask "kliploft-mini" do
  version "1.0"
  sha256 "f0c18f2d26414eaeccf4f2b0a24604927bfae332ca6ea14f16f708cb9c91a053"

  url "https://github.com/ronier83/KlipLoftMini/releases/download/v#{version}/KlipLoft-Mini-#{version}.dmg"
  name "KlipLoft Mini"
  desc "Clipboard history in one search bar"
  homepage "https://github.com/ronier83/KlipLoftMini"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "KlipLoft Mini.app"

  uninstall quit: "com.ronerez.KlipLoftMini"

  zap trash: [
    "~/Library/Application Scripts/com.ronerez.KlipLoftMini",
    "~/Library/Containers/com.ronerez.KlipLoftMini",
  ]
end
