note
	description: "GMLG_LINK deferred class."
	author: "Besken, Barth,Tornow, Charlé"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	GMLG_LINK
inherit
	GMLG_TAG

feature { NONE }
	src: STRING
	text: STRING

feature { ANY }
	-- accept
	-- @param: visitor: TAGS_VISITOR - one of visitors
	-- @Result: STRING - generated code from the visitor
	accept (visitor: TAGS_VISITOR): STRING
		deferred
		end

	-- link_to
	-- @param: smth: ANY - link to something (can be GMLG, GMLG_TAG or STRING)
	-- @Result: Void/None
	link_to(smth: ANY)
		deferred
		end

	-- get_src
	-- @param: None
	-- @Result: src feature of type STRING
	get_src: STRING
		do
			Result := src
		end

	-- get_text
	-- @param: None
	-- @Result: text feature of type STRING
	get_text: STRING
		do
			Result := text
		end
end
