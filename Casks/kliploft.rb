cask "kliploft" do
  version "2.50"
  sha256 "e55281878ef0f8b846192b02a6517f7d6cfd41dcdbf23a3aab492f24e6f24d9d"

  # Counts the install on kliploft.app, then redirects to /downloads/Klip-#{version}.dmg (see README)
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
