cask "sextant" do
  version "0.2.2"
  sha256 "748f1fd4476073c2e57878aee5256634c4daa29d39b29381bdf7b0393e5c8b35"

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
