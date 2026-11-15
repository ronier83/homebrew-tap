cask "kliploft" do
  version "2.05"
  sha256 "09d4490c09cf60e877ebd6a34fa024405baa22d7c2d1b58c8b3daf8712ce0632"

  url "https://www.getklip.me/downloads/Klip-#{version}.dmg"
  name "KlipLoft"
  desc "Clipboard manager with pinboards, search and iCloud sync"
  homepage "https://www.getklip.me/"

  livecheck do
    url "https://www.getklip.me/version.json"
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
