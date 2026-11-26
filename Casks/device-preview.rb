cask "device-preview" do
  version "0.2.2"
  sha256 "cd8d6f52230b0a990a829f14016a1ac635e35969db825bfa92bd55bb8e149c68"

  url "https://github.com/Stephan1226/device-preview/releases/download/v#{version}/Device-Preview-#{version}.zip"
  name "Device Preview"
  desc "웹 페이지를 여러 기기 화면 크기로 나란히 띄우고 조작을 한꺼번에 반영하는 앱"
  homepage "https://github.com/Stephan1226/device-preview"

  depends_on macos: ">= :ventura"

  app "Device Preview.app"

  # Apple 공증을 받지 않은 앱이라 다운로드 격리 표시를 지워서
  # "확인되지 않은 개발자" 경고 없이 바로 열리게 한다.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Device Preview.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.stephan1226.devicepreview.plist",
    "~/Library/Caches/com.stephan1226.devicepreview",
    "~/Library/WebKit/com.stephan1226.devicepreview",
    "~/Library/Saved Application State/com.stephan1226.devicepreview.savedState",
  ]
end
