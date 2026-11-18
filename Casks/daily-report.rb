cask "daily-report" do
  version "0.1.0"
  sha256 "16e4885924ca2ea125f45672a482017e1c27c35d484429c9e6c02c4d4e0ce80a"

  url "https://github.com/Stephan1226/daily-report-releases/releases/download/v#{version}/Daily-Report-#{version}-arm64.zip"
  name "Daily Report"
  desc "업무 보고서(일지)를 쓰고 서명해서 PDF와 docx로 저장하는 앱"
  homepage "https://github.com/Stephan1226/daily-report-releases"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Daily Report.app"

  # Apple 공증을 받지 않은 앱이라 다운로드 격리 표시를 지워서
  # "확인되지 않은 개발자" 경고 없이 바로 열리게 한다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Daily Report.app"]
  end

  # brew uninstall --zap 일 때만 지운다. 써 둔 일지와 서명이 여기에 있다.
  zap trash: [
    "~/Library/Application Support/com.stephan1226.dailyreport",
    "~/Library/Caches/com.stephan1226.dailyreport",
    "~/Library/WebKit/com.stephan1226.dailyreport",
  ]
end
