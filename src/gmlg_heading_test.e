note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_HEADING_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_gmlg_heading_set_italic
			-- Test FR 2.1.3.0

		note
			testing:  "covers/{GMLG_HEADING}", "covers/{GMLG_HEADING}.set_italic"
		local
			page: GMLG
			heading: GMLG_HEADING
		do
			create page.make("Title", "test")
			heading := page.add_heading ("This is a heading", 6)
			heading.set_italic

			assert("The heading is italic", equal(heading.get_italic, True))
		end



end
