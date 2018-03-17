note
	description: "GMLG_LINK deferred class."
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_LOCAL_LINK

inherit
	GMLG_LINK
		redefine
			link_to
		end
create
	make

feature { ANY }
	make(a_text: STRING; a_id: STRING)
	do
		text := a_text
		class_attr := "local-link"
		id := a_id
		src := ""
	end

	-- link_to(smth)
	-- @param: page: GML - a page to be linked to
	-- @Result: None
	link_to(page: GMLG)
		require else
			page_name_set: page.name /= Void and page.name /= ""
		do
			src := "/" + page.name + ".html"
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_link( Current )
		end
end
