require_relative '../cloud_natural_language_api'


CONTENT = <<-'EOF'
十八等官でしたから役所のなかでも、
ずうっと下の方でしたし俸給もほんのわずかでしたが、
受持ちが標本の採集や整理で生れ付き好きなことでしたから、
わたくしは毎日ずいぶん愉快にはたらきました。
EOF
# 引用元: ポラーノの広場 / 宮沢 賢治
# http://www.aozora.gr.jp/cards/000081/files/1935_19925.html

cnl = CloudNaturalLanguageAPI.new(ENV['API_KEY'])
puts cnl.analyze_sentiment(CONTENT, 'ja')

### 日本語利用時の注意点
#
# 日本語の感情分析は対応しておりません(2016/07/24現在)
=begin
{
  "error": {
    "code": 400,
    "message": "The language ja is not supported for document sentiment analysis.",
    "status": "INVALID_ARGUMENT"
  }
}
=end
