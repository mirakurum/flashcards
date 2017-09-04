require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open(
  "http://1000mostcommonwords.com/1000-most-common-russian-words/"))

doc.xpath('//*[@id="post-162"]/div/table/tbody/tr').each_with_index do |link, index|
  a = Nokogiri::HTML(link.to_s)
  if index.positive?
    Card.create(original_text: a.css('td')[1].content,
                translated_text: a.css('td')[2].content)
  end
end
