# Ron Erez's Homebrew tap

## KlipLoft

A free clipboard manager for Mac, with pinboards, search and iCloud sync. [kliploft.app](https://www.kliploft.app)

```bash
brew install --cask ronier83/tap/kliploft
```

Requires macOS 26 (Tahoe) or later on Apple silicon.

KlipLoft used to be called Klip. If you installed the `klip` cask, `brew upgrade` moves you to `kliploft` on its own.

## Maintaining

### How Homebrew installs are counted

- **KlipLoft:** the cask downloads from `https://www.kliploft.app/brew/Klip-<version>.dmg`. That link
  (`api/download.js?brew=` in Klip-Website, through a rewrite in its `vercel.json`) records the install as
  a Mac download with source `homebrew`, then redirects to `/downloads/Klip-<version>.dmg`. The file
  doesn't change, so the cask's `sha256` is the DMG's own.
  - It shows in the console with the other downloads, labelled "via Homebrew" in the activity feed.
  - Only the GET is counted. Homebrew checks the URL with a HEAD first, so each install counts once.
    `brew upgrade` counts too, since it downloads again.
  - Only stable names (`Klip-2.42.dmg`) are accepted; anything else is a 404. The DMG has to be in
    Klip-Website's `downloads/` folder.
- **KlipLoft Mini:** the cask downloads straight from the GitHub release, so GitHub counts it. The
  console's Mini total is GitHub's download count, which includes Homebrew installs.

### Releasing a new KlipLoft version

1. Publish `Klip-<version>.dmg` in Klip-Website's `downloads/` folder (and update `version.json`), and
   wait for the deploy.
2. Get its checksum: `shasum -a 256 Klip-<version>.dmg`.
3. In `Casks/kliploft.rb`, change `version` and `sha256` only. The `url` picks up the new version.
4. Check the link without counting a download (HEAD isn't counted):
   `curl -sI https://www.kliploft.app/brew/Klip-<version>.dmg` should answer `302`.
5. Push, then `brew update && brew fetch --cask --force ronier83/tap/kliploft`. This verifies the
   checksum end to end, and counts as one download.

### Releasing a new KlipLoft Mini version

Change `version` and `sha256` in `Casks/kliploft-mini.rb` (the checksum of `KlipLoft-Mini-<version>.dmg`
on the GitHub release). The `url` follows the version.
