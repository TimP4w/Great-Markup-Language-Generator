note
	description: "HTML visitor"
	author: "Besken"
	date: "$Date$"
	revision: "$Revision$"

class
	TAGS_HTML_VISITOR

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
			Result := "<img class=%"" + img.get_class + "%" id=%"" + img.get_id + "%"  width=%"" + img.get_width.out + "%" height=%"" + img.get_height.out + "%" src=%"" + img.get_src + "%" />"
		end

	visit_thbr(thbr: GMLG_THEMATIC_BREAK): STRING
		do
			Result := "<hr>"
		end

	visit_link(link: GMLG_LINK): STRING -- visit link
		local
			error: GMLG_ERROR
		do
			if link.get_src.is_empty then
				create error.make (3, "The link (" + link.get_text + ") is empty! It will be ignored.", "Empty Link", "attempting to create HTML code for a Link")
				error.print_error
				Result := ""
			else
				Result := "<a href=%"" + link.get_src + "%" id=%"" + link.get_id + "%" class=%"" + link.get_class + "%">" + link.get_text + "</a>"
			end
		end

	visit_para(para: GMLG_PARAGRAPH): STRING
		local
			code: STRING
			error: GMLG_ERROR
		do
			code := "<p class=%"" + para.get_class + "%" id=%"" + para.get_id + "%">"

			across para.get_content as ele loop
				if ele.item.get_style ~ "bold" then
					code.append("<b>")
					code.append(ele.item.get_text)
					code.append("</b> ")
				elseif ele.item.get_style ~ "italic" then
					code.append("<i>")
					code.append(ele.item.get_text)
					code.append("</i> ")
				elseif ele.item.get_style ~ "underlined" then
					code.append("<u>")
					code.append(ele.item.get_text)
					code.append("</u>")
				elseif ele.item.get_style ~ "" then
					code.append (ele.item.get_text + " ")
				else
					create error.make (1, "The style: '" + ele.item.get_style + "' you provided is not valid! It will be ignored.", "Invalid style for block", "attempting to create HTML code for a paragraph")
					error.print_error
					code.append (ele.item.get_text + " ")
				end
			end

			code.append("</p>")

			Result := code
		end

	visit_snippet(snippet: GMLG_SNIPPET): STRING
		do
			if snippet.get_div then
				Result := "<div id=%"" + snippet.get_id + "%" class=%"" + snippet.get_class + "%">" + snippet.get_code + "</div>"
			else
				Result := snippet.get_code
			end
		end

	visit_linebreak(linebreak: GMLG_LINEBREAK): STRING
		do
			Result := "<br>"
		end

	visit_list(list: GMLG_LIST): STRING
		local
			code: STRING
			accepted_types: ARRAY[STRING]
			accepted: BOOLEAN
			error: GMLG_ERROR
		do
			if list.get_ordered then
				code := "<ol id=%"" + list.get_id + "%" class=%"" + list.get_class + "%">"
			else
				code := "<ul id=%"" + list.get_id + "%" class=%"" + list.get_class + "%">"
			end
			accepted_types := <<"GMLG_ANCHOR_LINK", "GMLG_EXT_LINK", "GMLG_LOCAL_LINK", "GMLG_IMG", "GMLG_PARAGRAPH", "GMLG_SNIPPET">>
			across list.get_elements as ele loop
				accepted := False

				across accepted_types as type loop  -- check if element is of accepted type for a table
					if ele.item.generating_type.out.is_equal(type.item) then
						accepted := True
					end
				end

				if accepted then
					code.append ("%N%T%T<li>")
					code.append (ele.item.accept (Current))
					code.append ("</li>")
				else
					create error.make (3, "The tag type: '" + ele.item.generating_type.out + "' you provided is not valid! It will be ignored.", "Invalid tag for list", "attempting to create HTML code for a list")
					error.print_error
				end
			end

			if list.get_ordered then
				code.append ("%N%T</ol>")
			else
				code.append("%N%T</ul>")
			end
			Result := code
		end

	visit_heading(heading: GMLG_HEADING): STRING
		do
		    if heading.get_italic then
			    Result := "<h" + heading.get_level.out + " id=%"" + heading.get_id + "%">" + "<i>" + heading.get_text + "</i>" + "</h" + heading.get_level.out + ">"
			else
			    Result := "<h" + heading.get_level.out + " id=%"" + heading.get_id + "%">"  + heading.get_text +  "</h" + heading.get_level.out + ">"
			end
		end

	visit_table(table: GMLG_TABLE): STRING
		local
			code: STRING
			count: INTEGER
			accepted_types: ARRAY[STRING]
			accepted: BOOLEAN
			border: INTEGER
			error: GMLG_ERROR
		do
			accepted_types := <<"GMLG_ANCHOR_LINK", "GMLG_EXT_LINK", "GMLG_LOCAL_LINK", "GMLG_IMG", "GMLG_PARAGRAPH", "GMLG_SNIPPET">>
			if table.get_table.is_empty then
				Result := ""
			end
			if table.get_bordered then
				border := 1
			else
				border := 0
			end
			code := "<table id=%"" + table.get_id + "%" class=%"" + table.get_class + "%" border=%"" + border.out + "%">"
			count := 0
			across table.get_table as ele loop
				accepted := False

				if count \\ table.get_cols = 0 then -- this means it's a new row, therefore we need to add tr (table row)
					code.append ("%N%T%T<tr>")
				end

				code.append ("%N%T%T%T<td>")

				across accepted_types as type loop  -- check if element is of accepted type for a table
					if ele.item.generating_type.out.is_equal(type.item) then
						accepted := True
					end
				end

				if accepted then
					code.append (ele.item.accept(Current))
				else
					if ele.item.get_id ~ "ignoreme" then
						create error.make (1, "The table cell(" + count.out + ") is empty! It will be ignored.", "Empty table cell", "attempting to create HTML code for a table")
						error.print_error
					else
						create error.make (3, "The table cell(" + count.out + ") has an unsupported tag! It will be ignored.", "Unsupported Type in Table cell", "attempting to create HTML code for a table")
						error.print_error
					end
					code.append ("") -- if type not accepted don't print anything
				end

				code.append ("</td>")
				count := count + 1

				if count \\ table.get_cols = 0 and count /= 0 then -- this means it's the end of a row, so we close the tag
					code.append ("%N%T%T</tr>")
				end

			end
			code.append ("%N%T</table>")
			Result := code
		end
end
