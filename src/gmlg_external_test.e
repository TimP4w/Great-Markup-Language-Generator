note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_EXTERNAL_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_local_link_link_to
			-- Test FR 2.1.2.8.0
		note
			testing:  "covers/{GMLG_EXT_LINK}", "covers/{GMLG_EXT_LINK}.link_to"
		local
			page: GMLG
			ext_link: GMLG_EXT_LINK
		do
			create page.make("Title", "test")
			ext_link := page.add_ext_link("This is linked to a URL")
			ext_link.link_to ("https://zampeamollo.ch")
			assert ("Src feature is 'https://zampeamollo.ch'", equal(ext_link.get_src, "https://zampeamollo.ch"))
		end

	test_local_link_link_to_with_invalid_url
			-- Test FR 2.1.2.8.0
		note
			testing:  "covers/{GMLG_EXT_LINK}", "covers/{GMLG_EXT_LINK}.link_to"
		local
			page: GMLG
			ext_link: GMLG_EXT_LINK
		do
			create page.make("Title", "test")
			ext_link := page.add_ext_link("This is linked to a URL")
			ext_link.link_to ("abc")
			assert ("Src feature is ''", equal(ext_link.get_src, ""))

		end


end




