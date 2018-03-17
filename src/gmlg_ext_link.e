note
	description: "GMLG_LINK deferred class."
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_EXT_LINK

inherit
	GMLG_LINK
		redefine
			link_to
		end

create
	make

feature
	make(a_text: STRING; a_id: STRING)
	do
		text := a_text
		class_attr := "external-link"
		id := a_id
		src := ""
	end
feature { ANY }

	-- link_to(url)
	-- @param: url: STRING - a string of URL to be linked to
	-- @Result: None
	link_to(url: STRING)
		local
			error: GMLG_ERROR
		do
			if url.has_substring ("http://") or url.has_substring ("https://") then
				src := url
			else
				create error.make (3, "The URL: '" + url + "' you provided is not valid! It will be ignored.", "Invalid URL", "linking an external URL")
				error.print_error
			end
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_link( Current )
		end



end
