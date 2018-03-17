note
	description: "Snippet tag"
	author: "Besken, Barth, Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_SNIPPET

inherit
	GMLG_TAG

create
	make

feature {NONE}
	code: STRING
	div: BOOLEAN

feature {ANY}

	make(content: STRING; a_id: STRING)

		do
			id := a_id
			class_attr := "snippet"
			code := content
			div := False
		end

	-- toggle_div
	-- Toggle div from True to False and viceversa.
	-- If div is true the snippet will be surrounded by a div when outputting in HTML
	-- @param: None
	-- @Result: None
	toggle_div
		do
			div := not div
		end

	-- get_code
	-- @param: none
	-- @result: STRING - get code feature
	get_code: STRING
		do
			Result := code
		end

	-- get_div
	-- @param: none
	-- @result: BOOLEAN - get div feature
	get_div: BOOLEAN
		do
			Result := div
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING

		do
			Result := visitor.visit_snippet(Current)
		end

end
