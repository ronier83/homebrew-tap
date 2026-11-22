cask "kliploft" do
  version "2.42"
  sha256 "103679f7d41b301ec5996f47c1848c7115c72f92d87e711b70654fd11e62ceb4"

  url "https://www.kliploft.app/brew/Klip-#{version}.dmg"
  name "KlipLoft"
  desc "Clipboard manager with pinboards, search and iCloud sync"
  homepage "https://www.kliploft.app/"

  livecheck do
    url "https://www.kliploft.app/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Klip.app"

  uninstall quit: "com.ronerez.Klip"

  zap trash: [
    "~/Library/Application Support/Klip",
    "~/Library/Caches/com.ronerez.Klip",
    "~/Library/HTTPStorages/com.ronerez.Klip",
    "~/Library/HTTPStorages/com.ronerez.Klip.binarycookies",
    "~/Library/Preferences/com.ronerez.Klip.plist",
  ]
end
