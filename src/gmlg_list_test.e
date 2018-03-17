note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_LIST_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_list_add_content
			-- Test FR 2.1.2.5.0
		note
			testing:  "covers/{GMLG_LIST}", "covers/{GMLG_LIST}.add_content"
		local
			page: GMLG
			list: GMLG_LIST
			img: GMLG_IMG
		do
			create page.make("A wonderful title", "name")
			list := page.add_list(True)
			img := page.add_img("img.jpg")
			list.add_content (img)
			assert ("List elements count increased", equal(list.get_elements.count, 1))
			assert("List first element is of type image", equal(list.get_elements.first.generating_type.out, "GMLG_IMG"))
			if attached {GMLG_IMG} list.get_elements.first as img_test then -- cast type
				assert("The table-element(1,1) has feature src= test.jpg", equal(img_test.get_src, "img.jpg"))
			end


		end


end


