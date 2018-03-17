note
	description: "Markdown visitor."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TAGS_MARKDOWN_VISITOR

inherit
	TAGS_VISITOR

create
	make

feature { ANY }
	make
		do

		end
	visit_img(img: GMLG_IMG): STRING
		do
			Result := "![" + img.get_class + "](" + img.get_src + ")"
		end
	visit_thbr(thbr: GMLG_THEMATIC_BREAK): STRING
		do
			Result := "___"
		end
	visit_link(link: GMLG_LINK): STRING -- visit link
		local
			error: GMLG_ERROR
		do
			if link.get_src.is_empty then
				create error.make (3, "The link (" + link.get_text + ") is empty! It will be ignored.", "Empty Link", "attempting to create Markdown code for a Link")
				error.print_error
				Result := ""
			else
				Result := "[" + link.get_text + "](" + link.get_src + ")"
			end
		end

	visit_para(para: GMLG_PARAGRAPH): STRING
		local
			code: STRING
			error: GMLG_ERROR
		do
			code := ""

			across para.get_content as ele loop
				if ele.item.get_style ~ "bold" then
					code.append("**")
					code.append(ele.item.get_text)
					code.append("** ")
				elseif ele.item.get_style ~ "italic" then
					code.append("_")
					code.append(ele.item.get_text)
					code.append("_ ")
				elseif ele.item.get_style ~ "" then
					code.append (ele.item.get_text + " ")
				else
					create error.make (1, "The style: '" + ele.item.get_style + "' you provided is not valid! It will be ignored.", "Invalid style for block", "attempting to create Markdown code for a paragraph")
					error.print_error
					code.append (ele.item.get_text + " ")
				end
			end

			Result := code
		end

	visit_snippet(snippet: GMLG_SNIPPET): STRING
		do
			Result := snippet.get_code
		end

	visit_heading(heading: GMLG_HEADING): STRING
		local
			code: STRING
		do
			if heading.get_italic then
				code := "_" + heading.get_text + "_"
			else
				code := heading.get_text
			end

			if heading.get_level = 1 then
					code := "# " + code
			elseif heading.get_level = 2 then
					code := "## " + code
			elseif heading.get_level = 3 then
					code := "### " + code
			elseif heading.get_level = 4 then
					code := "#### " + code
			elseif heading.get_level = 5 then
					code := "##### " + code
			else
					code := "####### "  + code
			end

			Result := code
		end


	visit_table(table: GMLG_TABLE): STRING
		local
			code: STRING
			count: INTEGER
			accepted_types: ARRAY[STRING]
			accepted: BOOLEAN
			error: GMLG_ERROR
		do
			accepted_types := <<"GMLG_ANCHOR_LINK", "GMLG_EXT_LINK", "GMLG_LOCAL_LINK", "GMLG_IMG", "GMLG_PARAGRAPH", "GMLG_SNIPPET">>
			if table.get_table.is_empty then
				Result := ""
			end
			code := ""
			count := 0
			across table.get_table as ele loop

				if count = table.get_cols then -- workaround to make a markdown table, it has to be in the second row
					 across
                        1 |..| table.get_cols as col -- append |:---: for every column
           			 loop
                        code.append ("|:----:")
           			 end
					code.append ("|%N")
				end

				accepted := False

				code.append ("|")
				across accepted_types as type loop  -- check if element is of accepted type for a table
					if ele.item.generating_type.out.is_equal(type.item) then
						accepted := True
					end
				end

				if accepted then
					code.append (ele.item.accept(Current))
				else
					if ele.item.get_id ~ "ignoreme" then
						create error.make (1, "The table cell(" + count.out + ") is empty! It will be ignored.", "Empty table cell", "attempting to create Mwarkdown code for a table")
						error.print_error
					else
						create error.make (3, "The table cell(" + count.out + ") has an unsupported tag! It will be ignored.", "Unsupported Type in Table cell", "attempting to create Markdown code for a table")
						error.print_error
					end
					code.append ("") -- if type not accepted don't print anything
				end

				count := count + 1
				if count \\ table.get_cols = 0 and count /= 0 then -- this means it's the end of a row, so we close the row and go to the new line
					code.append ("|")
					code.append ("%N")
				end
			end

			Result := code
		end

	visit_linebreak(linebreak: GMLG_LINEBREAK): STRING
		do
			Result := "%N"
		end


	visit_list(list: GMLG_LIST): STRING
		local
			code: STRING
			accepted_types: ARRAY[STRING]
			accepted: BOOLEAN
			counter: INTEGER
			error: GMLG_ERROR
		do
			accepted_types := <<"GMLG_ANCHOR_LINK", "GMLG_EXT_LINK", "GMLG_LOCAL_LINK", "GMLG_IMG", "GMLG_PARAGRAPH", "GMLG_SNIPPET">>
			counter := 1
			code := ""

			across list.get_elements as ele loop
				accepted := False

				across accepted_types as type loop  -- check if element is of accepted type for a list
					if ele.item.generating_type.out.is_equal(type.item) then
						accepted := True
					end
				end -- end accepted_types check
				if accepted then
					if list.get_ordered then
						code.append ("%N" + counter.out + ". ")
						code.append (ele.item.accept (Current))
					else
						create error.make (3, "The tag type: '" + ele.item.generating_type.out + "' you provided is not valid! It will be ignored.", "Invalid tag for list", "attempting to create markdown code for a list")
						error.print_error
					end
				end -- end if accepted

				counter := counter + 1
			end -- end list loop
			Result := code
		end
end
