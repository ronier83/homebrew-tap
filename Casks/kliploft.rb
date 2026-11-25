cask "kliploft" do
  version "2.63"
  sha256 "90bb6a0ff41e3639663f82708db512398218937df32dd03b1dcf846fa013ba8f"

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
