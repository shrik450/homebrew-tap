cask "sextant" do
  version "0.2.0"
  sha256 "bfcabf190e38479f00fa7944f9a0b184ad017c497b09068bedcd309b4e5da59a"

  url "https://github.com/shrik450/sextant/releases/download/v#{version}/Sextant-#{version}.zip"
  name "Sextant"
  desc "Native macOS app for exploring and reviewing code"
  homepage "https://github.com/shrik450/sextant"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Sextant.app"
  binary "#{appdir}/Sextant.app/Contents/Helpers/sextant"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sextant.app"]
  end

  uninstall quit: "com.shrikanthup.Sextant"

  zap trash: [
    "~/.config/sextant",
    "~/Library/Preferences/com.shrikanthup.Sextant.plist",
    "~/Library/Saved Application State/com.shrikanthup.Sextant.savedState",
  ]
end
