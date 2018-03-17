note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GMLG_IMG_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

	test_gmlg_img_set_width_and_height
			-- Test FR 2.1.2.0

		note
			testing:  "covers/{GMLG_IMG}", "covers/{GMLG_IMG}.set_width", "covers/{GMLG_IMG}.set_height"
		local
			page: GMLG
			img: GMLG_IMG
		do
			create page.make("Title", "test")
			img := page.add_img ("img.jpg")
			img.set_height(100)
			img.set_width(100)
			assert ("Image height should be equal", equal(img.get_height, 100))
			assert ("Image width should be equal", equal(img.get_width, 100))
		end

	test_gmlg_img_set_width_and_height_with_invalid_values
			-- Test FR 2.1.2.0.1

		note
			testing:  "covers/{GMLG_IMG}", "covers/{GMLG_IMG}.set_width", "covers/{GMLG_IMG}.set_height"
		local
			page: GMLG
			img: GMLG_IMG
			no_retry: BOOLEAN
		do
			create page.make("Title", "test")
			img := page.add_img ("img.jpg")


			if not no_retry then
				img.set_height(1)
				img.set_width(2000)
			end

			assert("Exception raised", equal(no_retry, True))

			rescue
				if not no_retry then
					no_retry := True
					retry
				end

		end

end
