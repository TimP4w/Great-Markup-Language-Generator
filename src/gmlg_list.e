note
	description: "List tag"
	author: "Besken, Barth, Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_LIST

inherit
	GMLG_TAG

create
	make

feature {NONE}
	ordered: BOOLEAN
	elements: LINKED_LIST[GMLG_TAG]
	generating_page: GMLG

feature {ANY}

	-- make
	-- @param: order: BOOLEAN - ordered or unordered list
	-- @param: a_id: INTEGER - uniqe id of tag
	-- @Result: Void
	make(order: BOOLEAN; a_id: STRING; a_generating_page: GMLG)
		do
			id := a_id
			class_attr := "list"
			ordered := order
			generating_page := a_generating_page
			create elements.make
		end

	-- add_content
	-- @param: tag: GMLG_TAG - tag to be added in the list
	-- @Result: Void
	add_content(tag: GMLG_TAG)
		local
			index: INTEGER
			tag_copy: GMLG_TAG
		do
			-- remove from page linked list the tag in order to not print it twice!
			if generating_page.tags.has (tag) then
				index := generating_page.tags.index_of (tag, 1)
				generating_page.tags.go_i_th(index)
				generating_page.tags.remove
				generating_page.tags.finish -- return the cursor to the last position
			end
			tag_copy := tag.twin
			tag_copy.prepend_to_id ("list_"+id+"_")
			elements.put_right (tag_copy)
			elements.forth
		ensure
			elements_count_increased: elements.count = old elements.count + 1
		end

	-- get_ordered
	-- @param: none
	-- @result: BOOLEAN - get ordered feature
	get_ordered: BOOLEAN
		do
			Result := ordered
		end


	-- get_elements
	-- @param: none
	-- @result: LINKED_LIST[GMLG_TAG] - get elements feature
	get_elements: LINKED_LIST[GMLG_TAG]
		do
			Result := elements
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_list(Current)
		end

end
