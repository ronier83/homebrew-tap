cask "klip" do
  version "1.68"
  sha256 "7172958c88e94e5a479dece01af48d2705f24f761cfa3766a6cb26f962f8dc0c"

  url "https://getklip.vercel.app/downloads/Klip-#{version}.dmg"
  name "Klip"
  desc "Clipboard manager with pinboards, search and iCloud sync"
  homepage "https://getklip.vercel.app/"

  livecheck do
    url "https://getklip.vercel.app/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

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
