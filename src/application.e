note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make


feature {NONE} -- Initialization

	make
				local
					p: GMLG
					img1: GMLG_IMG
					thbr: GMLG_THEMATIC_BREAK
					anlk: GMLG_ANCHOR_LINK
					loclk: GMLG_LOCAL_LINK
					exlk: GMLG_EXT_LINK
					par1: GMLG_PARAGRAPH
					snip: GMLG_SNIPPET
					head: GMLG_HEADING
					img2: GMLG_IMG
					para2: GMLG_PARAGRAPH
					tbl: GMLG_TABLE
					lbr: GMLG_LINEBREAK
					para3: GMLG_PARAGRAPH
					para4: GMLG_PARAGRAPH
					lst: GMLG_LIST
				do
					create p.make("Title", "test") -- create a page
					img1 := p.add_img ("img.jpg") -- id 0
					thbr := p.add_thbr -- id 1
					anlk := p.add_anchor_link ("anchor link") -- id 2
					anlk.link_to (img1)
					loclk := p.add_local_link ("local link") -- id 3
					loclk.link_to (p)
					exlk := p.add_ext_link ("external link") -- id 4
					exlk.link_to ("https://google.com")
					par1 := p.add_paragraph -- id 5
					par1.add_block("no style here", "")
					par1.add_block("this is italic", "italic")
					par1.add_block("and this is bold", "bold")
					par1.add_block("and this is underlined", "underlined")
					snip := p.add_snippet ("<script>alert(%"hello%");</script>") -- id 6
					head := p.add_heading ("This is a heading",6) -- id 7
					img2 := p.add_img ("test_table.jpg") -- id 8
					para2 := p.add_paragraph -- id 9
					para2.add_block("test", "")
					tbl := p.add_table (3, 2) -- id 10
					tbl.add_number (1,1,1)
					tbl.add_number (2,1,2)
					tbl.add_string ("a",2,1)
					tbl.add_string ("b",2,2)
					tbl.add_element (img2, 3, 1)
					tbl.add_element (para2, 3, 2)
					lbr := p.add_linebreak -- id 11
					para3 := p.add_paragraph -- id 12
					para3.add_block("list example 1", "")
					para4 := p.add_paragraph -- id 13
					para4.add_block("list example 2", "")
					lst := p.add_list (True) -- id 14
					lst.add_content(para3)
					lst.add_content(para4)

					print("%N ------------ HTML ------------- %N")
					print(p.generate_html_code)
					print("%N ------------ MARKDOWN ------------- %N")
					print(p.generate_markdown_code)


		end

end
