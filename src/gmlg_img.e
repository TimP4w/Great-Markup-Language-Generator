note
	description: "IMAGE TAG Class"
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_IMG

inherit
	GMLG_TAG

create
	make

feature { NONE }
	src: STRING -- Name of image file
	width: INTEGER -- Width of image in pixels
	height: INTEGER -- Height of image in pixels

feature { ANY }
	-- make
	-- @param: a_src: STRING - URL/Img path, a_id: INTEGER - id of tag
	-- @Result: None/Void
	make (a_src: STRING; a_id: STRING)
		do
			src := a_src
			class_attr := "image"
			id := a_id
			width := 50
			height := 50
		end

	-- set_width
	-- @param: a_width: INTEGER - set a width for the image
	-- @Result: None/Void
	set_width (a_width: INTEGER)

		require
			width_size_invalid: a_width >= 5 and a_width <= 1024
		do
			width := a_width
		ensure
			old width /= width
		end

	-- set_height
	-- @param: a_height: INTEGER - set a height for the image
	-- @Result: None/Void
	set_height (a_height: INTEGER)
		require
			height_size_invalid: a_height >= 5 and a_height <= 1024
			height_not_empty: a_height /= Void
		do
			height := a_height
		ensure
			old height /= height
		end

	-- get_src
	-- @param: none
	-- @result: STRING - get src feature
	get_src: STRING
		do
			Result := src
		end

	-- get_width
	-- @param: none
	-- @result: INTEGER - get width feature
	get_width: INTEGER
		do
			Result := width
		end

	-- get_height
	-- @param: none
	-- @result: INTEGER - get height feature
	get_height: INTEGER
		do
			Result := height
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		do
			Result := visitor.visit_img (Current)
		end
end
