note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_LOCAL_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_local_link_link_to
			-- Test FR 2.1.2.7.0
		note
			testing:  "covers/{GMLG_LOCAL_LINK}", "covers/{GMLG_LOCAL_LINK}.link_to"
		local
			page: GMLG
			page2: GMLG
			local_link: GMLG_LOCAL_LINK
		do
			create page.make("Title", "test")
			create page2.make ("New Title", "anothertest")
			local_link := page.add_local_link("This is linked to a page")
			local_link.link_to (page2)
			assert ("Src feature is '/anothertest.html'", equal(local_link.get_src, "/anothertest.html"))
		end


end



