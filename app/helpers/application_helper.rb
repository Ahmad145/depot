module ApplicationHelper
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style" ] = "display: none"
		end
		attributes["style" ] = "display: true"	#This extra line should be commented in order to make hidden_div_if work properly...!!! Cause the style to always display:true
		content_tag("div" , attributes, &block)
	end
end
