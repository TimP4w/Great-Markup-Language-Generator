note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_gmlg_make_a_page
			-- Test FR 2.1.1.0

		note
			testing:  "covers/{GMLG}", "covers/{GMLG}.make"
		local
			page: GMLG
		do
			create page.make("A wonderful title", "name")
			assert ("Title should be equal", equal(page.title, "A wonderful title"))
			assert ("Name should be equal", equal(page.name, "name"))
			assert("Empty linked list created", page.tags.count = 0)
		end

	test_gmlg_make_a_page_unsupported_page_name
			-- Test FR 2.1.1.0.1
		note
			testing:  "covers/{GMLG}", "covers/{GMLG}.make"
		local
			page: GMLG
		do
			create page.make("A wonderful title", "a name")
			assert ("Name should be equal", equal(page.name, "a name"))
			assert("Empty linked list created", page.tags.count = 0)
		end

	test_gmlg_add_image
			-- Test FR 2.1.1.1
		note
			testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_img", "covers/{GMLG_IMG}", "covers/{GMLG_IMG}.make"
		local
			page: GMLG
			img: GMLG_IMG
		do
			create page.make("Title", "test")
			img := page.add_img ("https://zampeamollo.ch/public/images/uploads/gallery-24227.jpg")
			assert("Tags count increased", page.tags.count = 1)
			assert("First element of tags list is an image", equal(page.tags.first, img))
			assert ("Image src set", equal(img.get_src, "https://zampeamollo.ch/public/images/uploads/gallery-24227.jpg"))
			assert("Image width set", img.get_width = 50)
			assert("Image height set", img.get_height = 50)
			assert("Image class attribute set", equal(img.get_class, "image"))
			assert("Image id set", equal(img.get_id, "0"))
		end

	test_gmlg_add_thematic_break
			-- Test FR 2.1.1.2
		note
			testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_thbr", "covers/{GMLG_THEMATIC_BREAK}", "covers/{GMLG_THEMATIC_BREAK}.make"
		local
			page: GMLG
			thbr: GMLG_THEMATIC_BREAK
		do
			create page.make("Title", "test")
			thbr := page.add_thbr
			assert("Tags count increased", page.tags.count = 1)
			assert("First element of tags list is a thematic break", equal(page.tags.first, thbr))
			assert("Thematic break class attribute set", equal(thbr.get_class, "thematic-break"))
			assert("Thematic break id set", equal(thbr.get_id, "0"))
		end

	test_gmlg_add_anchor_link
			-- Test FR 2.1.1.3
		note
			testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_anchor_link", "covers/{GMLG_ANCHOR_LINK}", "covers/{GMLG_ANCHOR_LINK}.make"
		local
			page: GMLG
			anchor: GMLG_ANCHOR_LINK
		do
			create page.make("Title", "test")
			anchor := page.add_anchor_link ("This is an anchor link")

			assert("Tags count increased", page.tags.count = 1)
			assert("First element of tags list is an anchor link", equal(page.tags.first, anchor))
			assert("Anchor id set", equal(anchor.get_id, "0"))
			assert("Text set", equal(anchor.get_text, "This is an anchor link"))
			assert("Anchor class attribute set", equal(anchor.get_class, "anchor-link"))

		end

		test_gmlg_add_local_link
				-- Test FR 2.1.1.4
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_local_link", "covers/{GMLG_LOCAL_LINK}", "covers/{GMLG_LOCAL_LINK}.make"
			local
				page: GMLG
				locall: GMLG_LOCAL_LINK
			do
				create page.make("Title", "test")
				locall := page.add_local_link ("This is a local link")

				assert("Tags count increased", page.tags.count = 1)
				assert("First element of tags list is a local link", equal(page.tags.first, locall))
				assert("Local link id set", equal(locall.get_id, "0"))
				assert("Text set", equal(locall.get_text, "This is a local link"))
				assert("Local class attribute set", equal(locall.get_class, "local-link"))
			end

		test_gmlg_add_external_link
				-- Test FR 2.1.1.5
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_ext_link", "covers/{GMLG_EXT_LINK}", "covers/{GMLG_EXT_LINK}.make"
			local
				page: GMLG
				ext: GMLG_EXT_LINK
			do
				create page.make("Title", "test")
				ext := page.add_ext_link ("This is an external link")

				assert("Tags count increased", page.tags.count = 1)
				assert("First element of tags list is an external link", equal(page.tags.first, ext))

				assert("External link id set", equal(ext.get_id, "0"))
				assert("Text set", equal(ext.get_text, "This is an external link"))
				assert("External class attribute set", equal(ext.get_class, "external-link"))
			end

		test_gmlg_add_paragraph
				-- Test FR 2.1.1.6
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_paragraph", "covers/{GMLG_PARAGRAPH}", "covers/{GMLG_PARAGRAPH}.make"
			local
				page: GMLG
				par: GMLG_PARAGRAPH
			do
				create page.make("Title", "test")
				par := page.add_paragraph

				assert("Tags count increased", page.tags.count = 1)
				assert("First element of tags list is a paragraph", equal(page.tags.first, par))

				assert("Paragraph id set", equal(par.get_id, "0"))
				assert("Paragraph class attribute set", equal(par.get_class, "paragraph"))
			end

		test_gmlg_add_snippet
				-- Test FR 2.1.1.7
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_snippet", "covers/{GMLG_SNIPPET}", "covers/{GMLG_SNIPPET}.make"
			local
				page: GMLG
				snippet: GMLG_SNIPPET
			do
				create page.make("Title", "test")
				snippet := page.add_snippet("<iframe width=%"560%" height=%"315%" src=%"https://www.youtube.com/embed/4GFAZBKZVJY?rel=0&amp;showinfo=0%" frameborder=%"0%" allowfullscreen></iframe>")

				assert("Tags count increased", page.tags.count = 1)

				assert("First element of tags list is a snippet", equal(page.tags.first, snippet))
				assert("id set and it's 0", equal(snippet.get_id, "0"))
				assert("class attribute set", equal(snippet.get_class, "snippet"))

				assert("code is set", equal(snippet.get_code, "<iframe width=%"560%" height=%"315%" src=%"https://www.youtube.com/embed/4GFAZBKZVJY?rel=0&amp;showinfo=0%" frameborder=%"0%" allowfullscreen></iframe>"))
				assert("div is set to false", equal(snippet.get_div, False))

			end

		test_gmlg_add_heading
				-- Test FR 2.1.1.8
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_heading"
			local
				page: GMLG
				heading: GMLG_HEADING
			do
				create page.make("Title", "test")
				heading := page.add_heading ("This is a heading", 6)
				assert("Tags count increased", page.tags.count = 1)

				assert("First element of tags list is a heading", equal(page.tags.first, heading))
				assert("id set and it's 0", equal(heading.get_id, "0"))
				assert("class attribute set", equal(heading.get_class, "heading"))

				assert("text is set", equal(heading.get_text, "This is a heading"))
				assert("level is set", equal(heading.get_level, 6))
			end

		test_gmlg_add_heading_empty_text
				-- Test FR 2.1.1.8.0
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_heading"
			local
				page: GMLG
				heading: GMLG_HEADING
				no_retry: BOOLEAN
			do
				create page.make("Title", "test")

				if not no_retry then
					heading := page.add_heading ("", 6)
				end

				assert("Tags count not increased", equal(page.tags.count, 0))
				assert("Exception raised", equal(no_retry, True))

				rescue
					if not no_retry then
						no_retry := True
						retry
					end
			end

		test_gmlg_add_heading_illegal_level
				-- Test FR 2.1.1.8.1
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_heading", "covers/{GMLG_HEADING}", "covers/{GMLG_HEADING}.make"
			local
				page: GMLG
				heading: GMLG_HEADING
				no_retry: BOOLEAN
			do
				create page.make("Title", "test")

				if not no_retry then
					heading := page.add_heading ("This is a heading", 12)
				end

				assert("Tags count not increased", equal(page.tags.count, 0))
				assert("Exception raised", equal(no_retry, True))

				rescue
					if not no_retry then
						no_retry := True
						retry
					end
			end

		test_gmlg_add_table
				-- Test FR 2.1.1.9
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_table", "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.make"
			local
				page: GMLG
				table: GMLG_TABLE
			do
				create page.make("Title", "test")
				table := page.add_table (4,4)
				assert("Tags count increased", page.tags.count = 1)

				assert("First element of tags list is a table", equal(page.tags.first, table))
				assert("id set and it's 0", equal(table.get_id, "0"))
				assert("class attribute set", equal(table.get_class, "table"))

				assert("rows set", equal(table.get_rows, 4))
				assert("columns set", equal(table.get_cols, 4))
				assert("bordered set", equal(table.get_bordered, False))
				-- (?) TODO test Generating page
			end

		test_gmlg_add_linebreak
				-- Test FR 2.1.1.10
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_linebreak", "covers/{GMLG_LINEBREAK}", "covers/{GMLG_LINEBREAK}.make"
			local
				page: GMLG
				lbr: GMLG_LINEBREAK
			do
				create page.make("Title", "test")
				lbr := page.add_linebreak
				assert("Tags count increased", page.tags.count = 1)

				assert("First element of tags list is a linebreak", equal(page.tags.first, lbr))
				assert("id set and it's 0", equal(lbr.get_id, "0"))
				assert("class attribute set", equal(lbr.get_class, "linebreak"))
			end

		test_gmlg_add_list
				-- Test FR 2.1.1.11
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.add_list", "covers/{GMLG_LIST}", "covers/{GMLG_LIST}.make"
			local
				page: GMLG
				list: GMLG_LIST
			do
				create page.make("Title", "test")
				list := page.add_list(True)
				assert("Tags count increased", page.tags.count = 1)

				assert("First element of tags list is a list", equal(page.tags.first, list))
				assert("id set and it's 0", equal(list.get_id, "0"))
				assert("class attribute set", equal(list.get_class, "list"))

				assert("ordered attributes set", equal(list.get_ordered, True))
			end

		test_gmlg_generate_html_code
				-- Test FR 2.1.1.12
			note
				testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.generate_html_code",
						  "covers/{GMLG}.add_img", "covers/{GMLG_IMG}", "covers/{GMLG_IMG}.make",
						  "covers/{GMLG}.add_thbr", "covers/{GMLG_THEMATIC_BREAK}", "covers/{GMLG_THEMATIC_BREAK}.make",
						  "covers/{GMLG}.add_linebreak", "covers/{GMLG_LINEBREAK}", "covers/{GMLG_LINEBREAK}.make",
						  "covers/{GMLG}.add_table", "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.make",
						  "covers/{GMLG}.add_heading", "covers/{GMLG_HEADING}", "covers/{GMLG_HEADING}.make",
						  "covers/{GMLG}.add_snippet", "covers/{GMLG_SNIPPET}", "covers/{GMLG_SNIPPET}.make",
						  "covers/{GMLG}.add_paragraph", "covers/{GMLG_PARAGRAPH}", "covers/{GMLG_PARAGRAPH}.make",
						  "covers/{GMLG}.add_ext_link", "covers/{GMLG_EXT_LINK}", "covers/{GMLG_EXT_LINK}.make",
						  "covers/{GMLG}.add_local_link", "covers/{GMLG_LOCAL_LINK}", "covers/{GMLG_LOCAL_LINK}.make",
						  "covers/{GMLG}.add_anchor_link", "covers/{GMLG_ANCHOR_LINK}", "covers/{GMLG_ANCHOR_LINK}.make",
						  "covers/{GMLG}.add_list", "covers/{GMLG_LIST}", "covers/{GMLG_LIST}.make",
						  "covers/{TAGS_HTML_VISITOR}",
						  "covers/{TAGS_HTML_VISITOR}.visit_heading",
						  "covers/{TAGS_HTML_VISITOR}.visit_linebreak",
						  "covers/{TAGS_HTML_VISITOR}.visit_link",
						  "covers/{TAGS_HTML_VISITOR}.visit_list",
						  "covers/{TAGS_HTML_VISITOR}.visit_para",
						  "covers/{TAGS_HTML_VISITOR}.visit_snippet",
						  "covers/{TAGS_HTML_VISITOR}.visit_table",
						  "covers/{TAGS_HTML_VISITOR}.visit_thbr"
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
				final_code: STRING
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

				final_code := "<!DOCTYPE html>%N"
				final_code.append ("<html>%N")
				final_code.append ("<head>%N")
				final_code.append ("%T<meta charset='UTF-8'>%N")
				final_code.append ("%T<title>Title</title>%N")
				final_code.append ("</head>%N")
				final_code.append ("<body>%N")
				final_code.append ("%T<img class=%"image%" id=%"0%"  width=%"50%" height=%"50%" src=%"img.jpg%" />%N")
				final_code.append ("%T<hr>%N")
				final_code.append ("%T<a href=%"#0%" id=%"2%" class=%"anchor-link%">anchor link</a>%N")
				final_code.append ("%T<a href=%"/test.html%" id=%"3%" class=%"local-link%">local link</a>%N")
				final_code.append ("%T<a href=%"https://google.com%" id=%"4%" class=%"external-link%">external link</a>%N")
				final_code.append ("%T<p class=%"paragraph%" id=%"5%">no style here <i>this is italic</i> <b>and this is bold</b> <u>and this is underlined</u></p>%N")
				final_code.append ("%T<script>alert(%"hello%");</script>%N")
				final_code.append ("%T<h6 id=%"7%">This is a heading</h6>%N")
				final_code.append ("%T<table id=%"10%" class=%"table%" border=%"0%">%N")
				final_code.append ("%T%T<tr>%N")
				final_code.append ("%T%T%T<td>1</td>%N")
				final_code.append ("%T%T%T<td>2</td>%N")
				final_code.append ("%T%T</tr>%N")
				final_code.append ("%T%T<tr>%N")
				final_code.append ("%T%T%T<td>a</td>%N")
				final_code.append ("%T%T%T<td>b</td>%N")
				final_code.append ("%T%T</tr>%N")
				final_code.append ("%T%T<tr>%N")
				final_code.append ("%T%T%T<td><img class=%"image%" id=%"table_10_8%"  width=%"50%" height=%"50%" src=%"test_table.jpg%" /></td>%N")
				final_code.append ("%T%T%T<td><p class=%"paragraph%" id=%"table_10_9%">test </p></td>%N")
				final_code.append ("%T%T</tr>%N")
				final_code.append ("%T</table>%N")
				final_code.append ("%T<br>%N")
				final_code.append ("%T<ol id=%"12%" class=%"list%">%N")
				final_code.append ("%T%T<li><p class=%"paragraph%" id=%"list_12_10%">list example 1 </p></li>%N")
				final_code.append ("%T%T<li><p class=%"paragraph%" id=%"list_12_11%">list example 2 </p></li>%N")
				final_code.append ("%T</ol>%N")
				final_code.append ("</body>%N")
				final_code.append ("</html>")

	            assert("Generated HTML code as expected", equal(p.generate_html_code, final_code))
			end

			test_gmlg_generate_markdown_code
					-- Test FR 2.1.1.13
				note
					testing:  "covers/{GMLG}", "covers/{GMLG}.make", "covers/{GMLG}.generate_html_code",
							  "covers/{GMLG}.add_img", "covers/{GMLG_IMG}", "covers/{GMLG_IMG}.make",
							  "covers/{GMLG}.add_thbr", "covers/{GMLG_THEMATIC_BREAK}", "covers/{GMLG_THEMATIC_BREAK}.make",
							  "covers/{GMLG}.add_linebreak", "covers/{GMLG_LINEBREAK}", "covers/{GMLG_LINEBREAK}.make",
							  "covers/{GMLG}.add_table", "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.make",
							  "covers/{GMLG}.add_heading", "covers/{GMLG_HEADING}", "covers/{GMLG_HEADING}.make",
							  "covers/{GMLG}.add_snippet", "covers/{GMLG_SNIPPET}", "covers/{GMLG_SNIPPET}.make",
							  "covers/{GMLG}.add_paragraph", "covers/{GMLG_PARAGRAPH}", "covers/{GMLG_PARAGRAPH}.make",
							  "covers/{GMLG}.add_ext_link", "covers/{GMLG_EXT_LINK}", "covers/{GMLG_EXT_LINK}.make",
							  "covers/{GMLG}.add_local_link", "covers/{GMLG_LOCAL_LINK}", "covers/{GMLG_LOCAL_LINK}.make",
							  "covers/{GMLG}.add_anchor_link", "covers/{GMLG_ANCHOR_LINK}", "covers/{GMLG_ANCHOR_LINK}.make",
							  "covers/{GMLG}.add_list", "covers/{GMLG_LIST}", "covers/{GMLG_LIST}.make",
							  "covers/{TAGS_MARKDOWN_VISITOR}",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_heading",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_linebreak",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_link",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_list",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_para",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_snippet",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_table",
							  "covers/{TAGS_MARKDOWN_VISITOR}.visit_thbr"
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
					final_code: STRING
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

					final_code := "![image](img.jpg)%N"
					final_code.append ("___%N")
					final_code.append ("[anchor link](#0)%N")
					final_code.append ("[local link](/test.html)%N")
					final_code.append ("[external link](https://google.com)%N")
					final_code.append ("no style here _this is italic_ **and this is bold** and this is underlined %N")
					final_code.append ("<script>alert(%"hello%");</script>%N")
					final_code.append ("####### This is a heading%N")
					final_code.append ("|1|2|%N")
					final_code.append ("|:----:|:----:|%N")
					final_code.append ("|a|b|%N")
					final_code.append ("|![image](test_table.jpg)|test |%N")
					final_code.append ("%N")
					final_code.append ("%N")
					final_code.append ("%N")
					final_code.append ("%N")
					final_code.append ("1. list example 1 %N")
					final_code.append ("2. list example 2 %N")

		            assert("Generated markdown code as expected", equal(p.generate_markdown_code, final_code))
				end
end


