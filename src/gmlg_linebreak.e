note
	description: "Line break tag"
	author: "Besken, Barth, Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_LINEBREAK

inherit
	GMLG_TAG


create
	make

feature { ANY }
	-- make
	-- @param: a_id: INTEGER - uniqe id of tag
	-- @Result: None/Void
	make(a_id: STRING)
		do
			class_attr := "linebreak"
			id := a_id
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor	
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_linebreak (Current)
		end
end
