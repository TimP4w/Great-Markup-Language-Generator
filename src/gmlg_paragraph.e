note
	description: "paragraph application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_PARAGRAPH

inherit
	GMLG_TAG

create
	make

feature { NONE }
		content : LINKED_LIST[GMLG_BLOCK]

feature { ANY }

	make(a_id: STRING)
		do
			id := a_id
			class_attr := "paragraph"
			create content.make
		end

	-- add_block
	-- @param: a_string: STRING - String to be added in the block
	-- @param: a_style: STRING - Style of the block (bold/italic/underlined)
	-- @Result: None/Void
	add_block(a_string: STRING; a_style: STRING)
		require
			string_not_empty: a_string /= Void
			style_not_empty: a_style /= Void
			style_type: a_style ~ "bold" or a_style ~ "italic" or a_style ~ "underlined" or a_style ~ ""

		local
			block: GMLG_BLOCK
		do
			create block.make(a_string, a_style)
			content.put_right(block)
			content.forth
		ensure
			content.count = old content.count + 1
		end

	-- get_content
	-- @param: none
	-- @result: LINKED_LIST[GMLG_BLOCK] - get content feature
	get_content: LINKED_LIST[GMLG_BLOCK]
		do
			Result := content
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_para (Current)
		end
end
