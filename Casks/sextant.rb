cask "sextant" do
  version "0.1.0"
  sha256 "87b4fa284b0732ddaf0e5af16554cfc05a7a9eb0a34d6c52662488e4721b9e11"

  url "https://github.com/shrik450/sextant/releases/download/v#{version}/Sextant-#{version}.zip"
  name "Sextant"
  desc "Native macOS app for exploring and reviewing code"
  homepage "https://github.com/shrik450/sextant"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Sextant.app"
  binary "#{appdir}/Sextant.app/Contents/Helpers/sextant"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Sextant.app"]
  end

  uninstall quit: "com.shrikanthup.Sextant"

  zap trash: [
    "~/.config/sextant",
    "~/Library/Preferences/com.shrikanthup.Sextant.plist",
    "~/Library/Saved Application State/com.shrikanthup.Sextant.savedState",
  ]
end
