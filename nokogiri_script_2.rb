#If found HTML was a collection of li tags within a div with class="attr", how would you use Nokogiri to collect that information into one array?

require 'nokogiri'

demo_html = '<ul>
				<li>
					The Well-Grounded Rubyist
				</li>
				<li >
					David A. Black
				</li>
				<li >
					$34.99
				</li>
				<li >
					A great book for Rubyists
				</li>
				<li >
					Ruby Scholar
				</li>
			  </ul>'


demo_html_doc = Nokogiri::HTML(demo_html)
object = []
demo_html_doc.css("li").collect do |node|
	object<< node.text.strip   
end
puts object


=begin
Output
The Well-Grounded Rubyist
David A. Black
$34.99
A great book for Rubyists
Ruby Scholar
=end
