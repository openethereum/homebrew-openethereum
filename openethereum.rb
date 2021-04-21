require 'formula'

class Openethereum < Formula
  homepage 'https://github.com/openethereum/openethereum'
  version '3.2.4'
  url 'https://openethereum-releases.gnosis.io/v3.2.4/macos/openethereum'
  sha256 'e543b893f2ac2d03059935aea01db4f088f8eda35aac44857409ead18e616ec7'

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
