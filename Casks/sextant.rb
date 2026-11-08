cask "sextant" do
  version "0.3.1"
  sha256 "2da414768a01cb1d13e7a129daabb5d7b0c3da86550e10873a7b839faa1adfb8"

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
