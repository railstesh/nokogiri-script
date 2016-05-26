#Given the following HTML:
#<div class="listing">
#<div class="row">
#<span class="left">Title:</span>
#<span class="right">The Well-Grounded Rubyist</span>
#</div>
#<div class="row">
#<span class="left">Author:</span>
#<span class="right">David A. Black</span>
#</div>
#<div class="row">
#<span class="left">Price:</span>
#<span class="right">$34.99</span>
#</div>
#<div class="row">
#<span class="left">Description:</span>
#<span class="right">A great book for Rubyists</span>
#</div>
#<div class="row">
#<span class="left">Seller:</span>
#<span class="right">Ruby Scholar</span>
#</div>
#</div>

#Please collect all of the data presented into a key-value store. Please include code and the output.

require 'nokogiri'

demo_html = '<div class="listing">
<div class="row">
<span class="left">Title:</span>
<span class="right">The Well-Grounded Rubyist</span>
</div>
<div class="row">
<span class="left">Author:</span>
<span class="right">David A. Black</span>
</div>
<div class="row">
<span class="left">Price:</span>
<span class="right">$34.99</span>
</div>
<div class="row">
<span class="left">Description:</span>
<span class="right">A great book for Rubyists</span>
</div>
<div class="row">
<span class="left">Seller:</span>
<span class="right">Ruby Scholar</span>
</div>
</div>'


demo_html_doc = Nokogiri::HTML(demo_html)
object = {}
demo_html_doc.css("div.row").collect do |node|
	object[node.at_css("span.left").text.strip.gsub(":","").downcase] = node.at_css("span.right").text.strip  
end
puts object


=begin
Output
{"title"=>"The Well-Grounded Rubyist", "author"=>"David A. Black", "price"=>"$34.99", "description"=>"A great book for Rubyists", "seller"=>"Ruby Scholar"}
=end
