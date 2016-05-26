#Given HTML: "<div class="images"><img src="/pic.jpg"></div>" Using Nokogiri how would you select the src attribute from the image? Show me two different ways to do that correctly the the HTML given.


require 'nokogiri'

doc = Nokogiri::HTML('<div class="images"><img src="/pic.jpg"></div>')

image_src_mothod1 = doc.css("div.images img").attr('src')
puts image_src_mothod1

image_src_mothod2 = doc.css("img").attr('src')
puts image_src_mothod2

image_src_mothod3 = doc.css(".images img").attr('src')
puts image_src_mothod3

image_src_mothod4 = doc.css("div img").to_s.split("src=\"")[1].split("\"")[0]
puts image_src_mothod4

image_src_mothod5 = doc.css("div img").to_s.split("\"")[1]
puts image_src_mothod5


=begin
Output
/pic.jpg
/pic.jpg
/pic.jpg
/pic.jpg
/pic.jpg
=end
