require_relative '../cloud_natural_language_api'


CONTENT = <<-'EOF'
あのイーハトーヴォのすきとおった風、
夏でも底に冷たさをもつ青いそら、
うつくしい森で飾られたモリーオ市、
郊外のぎらぎらひかる草の波。
EOF

cnl = CloudNaturalLanguageAPI.new(ENV['API_KEY'])
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
