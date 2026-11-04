cask "klip" do
  version "1.54"
  sha256 "e14b8804e565706655c98d7a1c2bd68d4cfe17255a47067294f2c126f45d9d49"

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
  depends_on macos: ">= :golden_gate"

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
