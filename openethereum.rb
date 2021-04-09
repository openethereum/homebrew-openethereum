require 'formula'

class Openethereum < Formula
  homepage 'https://github.com/openethereum/openethereum'
  version '3.2.1'
  url 'https://openethereum-releases.gnosis.io/v3.2.1/macos/openethereum'
  sha256 '4209163e0e2a5f14d25a913ed03590bf2e0decbc07706b67ac61de8222324640'

  def install
    bin.install "openethereum"
  end

  test do
    system "#{bin}/openethereum", "--version"
  end

  plist_options :manual => "openethereum"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>ThrottleInterval</key>
        <integer>300</integer>
        <key>ProgramArguments</key>
        <array>
          <string>#{prefix}/bin/openethereum</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
