cask "daily-report" do
  version "0.1.1"
  sha256 "f090aaa317071dd6ecf6fb414f5bce554599fef31aa5fb05ca1ec023e53ca4c8"

  url "https://github.com/Stephan1226/daily-report-releases/releases/download/v#{version}/Daily-Report-#{version}-arm64.zip"
  name "Daily Report"
  desc "업무 보고서(일지)를 쓰고 서명해서 PDF와 docx로 저장하는 앱"
  homepage "https://github.com/Stephan1226/daily-report-releases"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Daily Report.app"

  # Apple 공증을 받지 않은 앱이라 다운로드 격리 표시를 지워서
  # "확인되지 않은 개발자" 경고 없이 바로 열리게 한다.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Daily Report.app"]
  end

  # brew uninstall --zap 일 때만 지운다. 써 둔 일지와 서명이 여기에 있다.
  zap trash: [
    "~/Library/Application Support/com.stephan1226.dailyreport",
    "~/Library/Caches/com.stephan1226.dailyreport",
    "~/Library/WebKit/com.stephan1226.dailyreport",
  ]
end
