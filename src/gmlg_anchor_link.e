note
	description: "GMLG_LINK deferred class."
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_ANCHOR_LINK

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
		class_attr := "anchor-link"
		id := a_id
		src := ""
	end

feature { ANY }

	-- link_to(smth)
	-- @param: smth: GMLG_TAG - a tag to be linked to
	-- @Result: None
	link_to(tag: GMLG_TAG)
		require else
			tag_id_set: tag.get_id /= Void
		do
			src := "#" + tag.get_id
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_link( Current )
		end
end
