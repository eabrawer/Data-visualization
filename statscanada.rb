require 'nokogiri'
require 'open-uri'

page = "http://www.statcan.gc.ca/start-debut-eng.html"
data = Nokogiri::HTML(open(page)) 




logo = data.css("#gcwu-sig-eng")
title = data.css("#gcwu-title-in")
menu = data.css (".mb-menu")
search = data.css("#search01")
list1 = data.css(".left-column ul")
list2 = data.css(".right-column ul")
foot = data.css("#gcwu-sft")
# Great example of data extrapolation

# population = data.css("#latest-indicators li:first-child .font-xlarge").text.gsub(',', '').to_i
# unemployment = data.css("#latest-indicators li:nth-child(3) .font-xlarge").text.to_f

# Take the specific information about element and use the variable in your own ID class
# or whatever underneath.
	# q.puts "<p>There are #{population*unemployment} people unemployed</p>"

	
File.open "canada2.html", "w" do |q| # the w means write
	q.puts "<html>"

	q.puts "<head>"
		q.puts "<title>"
			q.puts "Statistics Canada"
		q.puts "</title>"
		q.puts '<link rel="stylesheet" href="can2style.css" type="text/css">'
	q.puts "</head>"

	q.puts "<body>"
	
		q.puts "<div id=\"container\">"
			q.puts "<div id=\"header\">"
				q.puts "#{title}"
			q.puts "</div>"

			q.puts "<div id=\"nav\">"
				q.puts "#{menu}"
				q.puts "#{search}"
			q.puts "</div>"

			q.puts "<div id=\"main\">"
				# q.puts "<img src=\"http://www.statcan.gc.ca/wet-boew/build/theme-gcwu-fegc/images/sig-eng.gif\"> "
				q.puts "<div id=\"col1\">"	
					q.puts "#{list1}"
				q.puts "</div>"

				q.puts "<div id=\"col2\">"	
					q.puts "#{list2}"
				q.puts "</div>"
			q.puts "</div>"

			q.puts "<div style=\"clear:both;\">"
			q.puts "</div>"

			q.puts "<div id=\"footer\">"
				q.puts "#{foot}"
			q.puts "</div>"
		q.puts "</div>"

	q.puts "</body>"

	q.puts "</html>"


	# q.puts body_title
	# q.puts body_content
	# q.puts footer
end
