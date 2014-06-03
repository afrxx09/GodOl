# encoding: utf-8
module ApplicationHelper
	
	def full_title(page_title)
		base_title = "God Öl"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	
	def current_page(path)
		"current" if current_page?(path)
	end
	
end
