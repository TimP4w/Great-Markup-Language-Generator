note
	description: "Visitor deferred class"
	author: "Besken, Barth, Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TAGS_VISITOR


feature { ANY }


feature { ANY }

	-- visit_img
	-- @param: img: GMLG_IMG
	-- @result: STRING - string representing the tag in the selected format
	visit_img(img: GMLG_IMG): STRING -- visit image
		deferred
		end
	-- visit_thbr
	-- @param: thbr: GMLG_THEMATIC_BREAK
	-- @result: STRING - string representing the tag in the selected format
	visit_thbr(thbr: GMLG_THEMATIC_BREAK): STRING -- visit thematic break
		deferred
		end
	-- visit_link
	-- @param: link: GMLG_LINK
	-- @result: STRING - string representing the tag in the selected format
	visit_link(link: GMLG_LINK): STRING -- visit link
		deferred
		end
	-- visit_para
	-- @param: paragraph: GMLG_PARAGRAPH
	-- @result: STRING - string representing the tag in the selected format
	visit_para(paragraph: GMLG_PARAGRAPH): STRING -- visit paragraph
		deferred
		end
	-- visit_snippet
	-- @param: snippet: GMLG_SNIPPET
	-- @result: STRING - string representing the tag in the selected format
	visit_snippet(snippet: GMLG_SNIPPET): STRING -- visit snippet
		deferred
		end
	-- visit_linebreak
	-- @param: linebreak: GMLG_LINEBREAK
	-- @result: STRING - string representing the tag in the selected format
	visit_linebreak(linebreak: GMLG_LINEBREAK): STRING -- visit linebreak
		deferred
		end
	-- visit_list
	-- @param: list: GMLG_LIST
	-- @result: STRING - string representing the tag in the selected format
	visit_list(list: GMLG_LIST): STRING -- visit list
		deferred
		end
	-- visit_heading
	-- @param: heading: GMLG_HEADING
	-- @result: STRING - string representing the tag in the selected format
	visit_heading(heading: GMLG_HEADING): STRING -- visit heading
		deferred
		end
	-- visit_table
	-- @param: table: GMLG_TABLE
	-- @result: STRING - string representing the tag in the selected format
	visit_table(table: GMLG_TABLE): STRING -- visit table
		deferred
		end
end
