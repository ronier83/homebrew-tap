cask "kliploft" do
  version "1.72"
  sha256 "fa863f2f2f5061bf244464a9a8b3d717f8c0a030dea479ad10c05b060cf58105"

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
