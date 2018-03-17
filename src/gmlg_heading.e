note
	description: "Heading tag"
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_HEADING

inherit
	GMLG_TAG

create
	make

feature { NONE }
    level : INTEGER
    text : STRING
    is_italic : BOOLEAN

feature { ANY }
	-- make
	-- @param: a_id: INTEGER - uniqe id of tag
	-- @Result: None/Void
	make(a_text: STRING; a_level: INTEGER; a_id: STRING)
		do
		    text := a_text
			id := a_id
			class_attr := "heading"
			is_italic := False
			level := a_level
		end

	-- set_italic
	-- @param: None
	-- @Result: None/Void
	set_italic -- Set style of heading
		do
		    is_italic := True
		ensure
			updated : old is_italic /= is_italic
	    end


	-- get_level
	-- @param: none
	-- @result: INTEGER - get level feature
	get_level: INTEGER
		do
			Result := level
		end

	-- get_text
	-- @param: none
	-- @result: STRING - get text feature
	get_text: STRING
		do
			Result := text
		end

	-- get_italic
	-- @param: none
	-- @result: BOOLEAN - get is_italic feature
	get_italic: BOOLEAN
		do
			Result := is_italic
		end


	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_heading (Current)
		end
end
