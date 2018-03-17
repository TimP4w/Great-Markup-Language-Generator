note
	description: "Table tag"
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_TABLE

inherit
	GMLG_TAG

create
	make

feature { NONE }
    cols : INTEGER
    rows : INTEGER
    table: ARRAY2[GMLG_TAG]
    bordered: BOOLEAN
    generating_page: GMLG

feature { ANY }
	-- make
	-- @param: a_id: INTEGER - uniqe id of tag
	-- @Result: None/Void
	make(a_rows: INTEGER; a_cols: INTEGER; a_id: STRING; a_generating_page: GMLG)
		local
			lbr: GMLG_LINEBREAK
		do
			create lbr.make("ignoreme") -- id doesn't matter since it's not printed
			create table.make_filled (lbr, a_rows, a_cols)
		    rows := a_rows
		    cols := a_cols
			id := a_id
			class_attr := "table"
			bordered := False
			generating_page := a_generating_page
		end

	-- add_element
	-- @param: tag: GMLG_TAG - Element of type tag to be added
	-- @param: row: INTEGER - Row position
	-- @param: column: INTEGER - Columns position
	-- @Result: None/Void
    add_element(tag: GMLG_TAG; row, column: INTEGER)
    	require
    		row_col_above_zero: row > 0 and column > 0
    		legal_row_and_col: row <= Current.get_rows and column <= Current.get_cols
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
			tag_copy.prepend_to_id ("table_"+id+"_")
			table.put (tag_copy, row, column)
		ensure
			table.item (row, column) /= old table.item (row, column)
        end

	-- add_number
	-- @param: ele: INTEGER - Element of type integer to be added
	-- @param: row: INTEGER - Row position
	-- @param: column: INTEGER - Columns position
	-- @Result: None/Void
	add_number(ele: INTEGER; row, column: INTEGER)
	    require
    		row_col_above_zero: row > 0 and column > 0
    		legal_row_and_col: row <= Current.get_rows and column <= Current.get_cols
		local
			number: GMLG_SNIPPET
			new_id: STRING
		do
			new_id := "table_"+table.count.out
			create number.make (ele.out, new_id)
			table.put (number, row, column)
		ensure
			table.item (row, column) /= old table.item (row, column)
		end

	-- add_string
	-- @param: ele: STRING - Element of type string to be added
	-- @param: row: INTEGER - Row position
	-- @param: column: INTEGER - Columns position
	-- @Result: None/Void
	add_string(ele: STRING; row, column: INTEGER)
    	require
    		row_col_above_zero: row > 0 and column > 0
    		legal_row_and_col: row <= Current.get_rows and column <= Current.get_cols
		local
			str: GMLG_SNIPPET
			new_id: STRING
		do
			new_id := "table_"+table.count.out
			create str.make (ele, new_id)
			table.put (str, row, column)
		ensure
			table.item (row, column) /= old table.item (row, column)
		end

	-- toggle_bordered
	-- Toggle bordered from True to False and viceversa.
	-- If bordered is true the table will have a border in HTML
	-- @param: None
	-- @Result: None
	toggle_bordered
		do
			bordered := not bordered
		end


	-- get_cols
	-- @param: none
	-- @result: INTEGER - get cols feature
	get_cols : INTEGER
		do
			Result := cols
		end

	-- get_rows
	-- @param: none
	-- @result: INTEGER - get rows feature		
    get_rows : INTEGER
    	do
			Result := rows
		end

	-- get_table
	-- @param: none
	-- @result: ARRAY2[GMLG_TAG] - get table feature		
    get_table: ARRAY2[GMLG_TAG]
		do
			Result := table
		end

	-- get_bordered
	-- @param: none
	-- @result: BOOLEAN - get bordered feature
    get_bordered: BOOLEAN
		do
			Result := bordered
		end
	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_table (Current)
		end
end
