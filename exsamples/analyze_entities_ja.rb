require_relative '../lib/cloud_natural_language'


CONTENT = <<-'EOF'
あのイーハトーヴォのすきとおった風、
夏でも底に冷たさをもつ青いそら、
うつくしい森で飾られたモリーオ市、
郊外のぎらぎらひかる草の波。
EOF
# 引用元: ポラーノの広場 / 宮沢 賢治
# http://www.aozora.gr.jp/cards/000081/files/1935_19925.html

cnl = CloudNaturalLanguage::API.new(ENV['API_KEY'])
puts cnl.analyze_entities(CONTENT, 'ja')

### 日本語利用時の注意点
#
#  - name, contentはバイト列で返ってくるのでdecodeが必要となる
#  - beginOffsetがバイト列の位置を示している
#
=begin
{
  "entities": [
    {
      "name": "イーハトーヴォ",
      "type": "EVENT",
      "metadata": {},
      "salience": 0,
      "mentions": [
        {
          "text": {
            "content": "イーハトーヴォ",
            "beginOffset": 6
          }
        }
      ]
    },
    {
      "name": "モリーオ市",
      "type": "LOCATION",
      "metadata": {},
      "salience": 0,
      "mentions": [
        {
          "text": {
            "content": "モリーオ市",
            "beginOffset": 137
          }
        }
      ]
    },
    {
      "name": "ぎらぎらひかる",
      "type": "PERSON",
      "metadata": {},
      "salience": 0,
      "mentions": [
        {
          "text": {
            "content": "ぎらぎらひかる",
            "beginOffset": 165
          }
        }
      ]
    }
  ],
  "language": "ja"
}
=end
