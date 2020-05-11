require 'formula'

class Openethereum < Formula
  homepage 'https://github.com/openethereum/openethereum'
  version '3.0.0'
  url 'https://openethereum-releases.gnosis.io/v3.0.0/x86_64-apple-darwin/openethereum'
  sha256 '72d1931b3f4fde77cd439820e967179e400b3fdfa3c3f73b0316481a8cd02ec0'

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
