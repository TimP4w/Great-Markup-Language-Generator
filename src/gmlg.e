note
	description: "GMLG base class, from here it's possible to add pages and tags."
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG

create
	make

feature
	name: STRING
			--Name of the page
	title: STRING
			--Title of the page
	tags: LINKED_LIST[GMLG_TAG]
			-- Linked list of tags


feature {ANY} -- creator
	make(a_title: STRING; a_name: STRING)
		require
			page_name_not_empty: a_name /= Void
			page_name_less_than_20_chars: a_name.count <= 20
		local
			error: GMLG_ERROR
		do
			if a_name.has_substring (" ") then
				create error.make (3, "The name for the page: '" + a_name + "' you provided is not valid! It can't contain spaces", "Invalid page name", "creating a page")
				error.print_error
			end
			title := a_title
			a_name.to_lower
			name := a_name
			create tags.make
		end

feature {ANY} -- add tags / API
	-- add_img(src)
	-- @param src: STRING - url or name of image file
	-- @Result: GMLG_IMG  - GMLG_IMG object
	add_img(src: STRING): GMLG_IMG
			require
				src_non_empty: src /= ""
			--Create an image and adds it to the tags linked list
			local
				img: GMLG_IMG
			do
				create img.make(src, tags.count.out)
				tags.put_right (img)
				tags.forth
				Result := img
			ensure -- Post condition, check if tags counter increases
				tags.count = old tags.count + 1
			end

	-- add_thbr(src)
	-- @param: none
	-- @Result: GMLG_THEMATIC_BREAK  - GMLG_THEMATIC_BREAK object
	add_thbr: GMLG_THEMATIC_BREAK
			--Create a thematic break and adds it to the tags linked list
			local
				thbr: GMLG_THEMATIC_BREAK
			do
				create thbr.make(tags.count.out)
				tags.put_right (thbr)
				tags.forth
				Result := thbr
			ensure
				tags.count = old tags.count + 1
			end

	-- add_anchor_link(text)
	-- @param: text: STRING - Text of the link
	-- @Result: GMLG_ANCHOR_LINK  - GMLG_ANCHOR_LINK object			
	add_anchor_link(a_text: STRING): GMLG_ANCHOR_LINK
		require
			text_not_empty: a_text /= ""
		local
			anchor_link: GMLG_ANCHOR_LINK
		do
			create anchor_link.make(a_text, tags.count.out)
			tags.put_right (anchor_link)
			tags.forth
			Result := anchor_link
		end

	-- add_local_link(text)
	-- @param: text: STRING - Text of the link
	-- @Result: GMLG_LOCAL_LINK  - GMLG_LOCAL_LINK object			
	add_local_link(a_text: STRING): GMLG_LOCAL_LINK
		require
			text_not_empty: a_text /= ""
		local
			local_link: GMLG_LOCAL_LINK
		do
			create local_link.make(a_text, tags.count.out)
			tags.put_right (local_link)
			tags.forth
			Result := local_link
		end

	-- add_anchor_link(text)
	-- @param: text: STRING - Text of the link
	-- @Result: GMLG_EXT_LINK  - GMLG_EXT_LINK object
	add_ext_link(a_text: STRING): GMLG_EXT_LINK
		require
			text_not_empty: a_text /= ""
		local
			ext_link: GMLG_EXT_LINK
		do
			create ext_link.make(a_text, tags.count.out)
			tags.put_right (ext_link)
			tags.forth
			Result := ext_link
		end

	-- add_paragraph
	-- @param: none
	-- @Result: GMLG_PARAGRAPH  - GMLG_PARAGRAPH object
	add_paragraph: GMLG_PARAGRAPH
			--Create an paragraph and adds it to the tags linked list
			local
				paragraph: GMLG_PARAGRAPH
			do
				create paragraph.make(tags.count.out)
				tags.put_right (paragraph)
				tags.forth
				Result := paragraph
			ensure -- Post condition, check if tags counter increases
				tags.count = old tags.count + 1
			end

	-- add_snippet
	-- @param: code: STRING - Code of the snippet
	-- @Result: GMLG_SNIPPET  - GMLG_SNIPPET object
	add_snippet(code: STRING): GMLG_SNIPPET
			require
				code_not_empty: code /= ""
			--Create a snippet and adds it to the tags linked list
			local
				snippet: GMLG_SNIPPET
			do
				create snippet.make(code, tags.count.out)
				tags.put_right (snippet)
				tags.forth
				Result := snippet
			ensure
				tags.count = old tags.count + 1
			end

	-- add_heading
	-- @param: text: STRING - Text of heading
	-- @param: level: INTEGER - level of heading
	-- @Result: GMLG_HEADING  - GMLG_HEADING object
	add_heading(text: STRING; level: INTEGER): GMLG_HEADING
			require
				text_non_empty: text /= ""
				legal_level: 1 <= level and level <= 6
			--Create a heading and adds it to the tags linked list
			local
				heading: GMLG_HEADING
			do
				create heading.make(text, level, tags.count.out)
				tags.put_right (heading)
				tags.forth
				Result := heading
			ensure
				tags.count = old tags.count + 1
			end

	-- add_table
	-- @param: rows: INTEGER - Number of rows for the table
	-- @param: cols: INTEGER - Number of columns for the table
	-- @Result: GMLG_TABLE  - GMLG_TABLE object
	add_table(rows : INTEGER; cols : INTEGER): GMLG_TABLE
		require
			rows_cols_bigger_than_zero: rows > 0 and cols > 0
		--Create a table and adds it to the tags linked list
		local
			table: GMLG_TABLE
		do
			create table.make(rows, cols, tags.count.out, Current)
			tags.put_right (table)
			tags.forth
			Result := table
		ensure
			tags.count = old tags.count + 1
		end

	-- add_linebreak
	-- @param: None
	-- @Result: GMLG_LINEBREAK  - GMLG_LINEBREAK object
	add_linebreak: GMLG_LINEBREAK
		local
			linebreak: GMLG_LINEBREAK
		do
			create linebreak.make(tags.count.out)
			tags.put_right (linebreak)
			tags.forth
			Result := linebreak
		end

	-- add_list
	-- @param: order: BOOLEAN - True for ordered / False for unordered list
	-- @Result: GMLG_LIST  - GMLG_LIST object
	add_list(order: BOOLEAN): GMLG_LIST
		local
			list: GMLG_LIST
		do
			create list.make(order, tags.count.out, Current)
			tags.put_right (list)
			tags.forth
			Result := list
		end

feature {ANY} -- Visit tags and generate code

	-- generate_html_code
	-- @param: none
	-- @Result: STRING  - Final string with html code generated
	generate_html_code: STRING
		local
			html_visitor: TAGS_HTML_VISITOR
			code: STRING
		do
			create code.make_empty -- creade variable to hold out string
			create html_visitor.make -- create html visitor
			code.append ("<!DOCTYPE html>%N") -- basic html tags
			code.append ("<html>%N")
			code.append ("<head>%N")
			code.append ("%T<meta charset='UTF-8'>%N")
			code.append ("%T<title>" + title + "</title>%N")
			code.append ("</head>%N")
			code.append ("<body>%N")
			across  -- traverse linked list
				tags as tag
			loop
				code.append ("%T")
				code.append (tag.item.accept(html_visitor)) -- visit tag
				code.append ("%N")
			end
			code.append ("</body>%N")
			code.append ("</html>")
			Result := code

		end

	-- generate_markdown_code
	-- @param: none
	-- @Result: STRING  - Final string with markdown code generated
	generate_markdown_code: STRING
		local
			markdown_visitor: TAGS_MARKDOWN_VISITOR
			code: STRING
		do
			create code.make_empty
			create markdown_visitor.make
			across
				tags as tag
			loop
				code.append_string_general (tag.item.accept(markdown_visitor))
				code.append ("%N")
			end
			Result := code
		end


end
