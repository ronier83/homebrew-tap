cask "klip" do
  version "1.57"
  sha256 "dfcd07e893bb0c7e05796f7c9f213ec614443ad5db5de90c14c5a061a55a8fe2"

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
