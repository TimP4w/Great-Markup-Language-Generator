note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_TABLE_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_gmlg_table_toggle_bordered
			-- Test FR 2.1.4.0

		note
			testing:  "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.toggle_bordered"
		local
			page: GMLG
			table: GMLG_TABLE
		do
			create page.make("Title", "test")
			table := page.add_table (1,1)
			table.toggle_bordered

			assert("The table is bordered", equal(table.get_bordered, True))
		end

	test_gmlg_table_add_element
			-- Test FR 2.1.4.1

		note
			testing:  "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.add_element"
		local
			page: GMLG
			table: GMLG_TABLE
			img: GMLG_IMG

		do
			create page.make("Title", "test")

			table := page.add_table (1,1)
			img := page.add_img ("test.jpg")
			assert("Image added to page linked list",equal(page.tags.i_th (2) ,img))
			table.add_element(img,1,1)
			assert("The table-element(1,1) is from type GMLG_IMG", equal(table.get_table.item(1,1).generating_type.out ~ "GMLG_IMG", True))

			if attached {GMLG_IMG} table.get_table.item(1,1) as img_test then -- cast type
				assert("The table-element(1,1) has feature src= test.jpg", equal(img_test.get_src, "test.jpg"))
			end

			-- assert("Image removed from page linked list",equal(page.tags.i_th (2), Void)) -- Removed because causes invalid index exception (means that it's working)
			assert("Page linked list count equals 1", equal(page.tags.count, 1))
			assert("Image id equals table_0_1", equal(table.get_table.item (1,1).get_id, "table_0_1"))


		end
	test_gmlg_table_add_number
			-- Test FR 2.1.4.2
		note
			testing:  "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.add_number"
		local
			page: GMLG
			table: GMLG_TABLE
		do
			create page.make("Title", "test")
			table := page.add_table (1,1)
			table.add_number(10,1,1)
			assert("Table element (1,1 is of type GMLG_SNIPPET", equal(table.get_table.item (1,1).generating_type.out ~ "GMLG_SNIPPET", True))
			if attached {GMLG_SNIPPET} table.get_table.item(1,1) as snippet_test then -- cast type
				assert("The table-element(1,1) has feature src= test.jpg", equal(snippet_test.get_code, "10"))
			end
		end

	test_gmlg_table_add_string
			-- Test FR 2.1.4.3
		note
			testing:  "covers/{GMLG_TABLE}", "covers/{GMLG_TABLE}.add_string"
		local
			page: GMLG
			table: GMLG_TABLE
		do
			create page.make("Title", "test")
			table := page.add_table (1,1)
			table.add_string ("this is a test", 1, 1)
			assert("Table element (1,1 is of type GMLG_SNIPPET", equal(table.get_table.item (1,1).generating_type.out ~ "GMLG_SNIPPET", True))
			if attached {GMLG_IMG} table.get_table.item(1,1) as img_test then -- cast type
				assert("The table-element(1,1) has feature src= test.jpg", equal(img_test.get_src, "this is a test"))
			end


		end

end
