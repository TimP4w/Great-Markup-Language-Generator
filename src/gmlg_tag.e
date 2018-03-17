note
	description: "GMLG_TAG deferred class."
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	GMLG_TAG


feature { NONE }
	id: STRING -- ID of the tag, which is unique
	class_attr: STRING -- Class of the tag

feature { GMLG_LIST, GMLG_TABLE }

	prepend_to_id(a_str: STRING)
		do
			id := a_str+id
		end

feature { ANY }
	-- set_class
	-- @param: a_class: STRING - set a class attribute for the image
	-- @Result: None/Void
	set_class (a_class : STRING) -- Set a class for the tag
		require else
			a_class /= ""
		do
			class_attr := a_class
		ensure then
			old class_attr /= class_attr
		end

	-- get_class
	-- @param: None
	-- @Result: class_attr feature of type STRING
	get_class: STRING
		do
			Result := class_attr
		end

	-- get_id
	-- @param: None
	-- @Result: id feature of type STRING
	get_id: STRING
		do
			Result := id
		end

	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		deferred
		end

end
