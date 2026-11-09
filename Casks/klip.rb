cask "klip" do
  version "1.63"
  sha256 "051be778b86d1536f8079e180c8a698a9fdd6693b432b205a7665d094482ce2b"

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
