cask "device-preview" do
  version "0.1.1"
  sha256 "9fda30b6a6954b5e601d0470b31642589d33260866625e0bcf29bab659f73eed"

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
