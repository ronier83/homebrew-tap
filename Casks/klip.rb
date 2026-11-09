cask "klip" do
  version "1.64"
  sha256 "113c21a5f5d328b83bed0c94a9509e782ebe57de89a0a8a57c337ce5d6dc60db"

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
