note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_ANCHOR_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_anchor_link_link_to
			-- Test FR 2.1.2.6.0
		note
			testing:  "covers/{GMLG_ANCHOR_LINK}", "covers/{GMLG_ANCHOR_LINK}.link_to"
		local
			page: GMLG
			heading: GMLG_HEADING
			anchor: GMLG_ANCHOR_LINK
		do
			create page.make("Title", "test")
			anchor := page.add_anchor_link("This is linked to a heading")
			heading := page.add_heading("This is a heading", 6)
			anchor.link_to (heading)
			assert("Tag id set", anchor.get_id /= Void)
			assert ("Src feature is '#1'", equal(anchor.get_src, "#1"))


		end


end
