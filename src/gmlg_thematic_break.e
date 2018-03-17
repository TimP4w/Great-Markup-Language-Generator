note
	description: "Thematic break tag"
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_THEMATIC_BREAK

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
			id := a_id
			class_attr := "thematic-break"
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor	
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_thbr (Current)
		end
end
