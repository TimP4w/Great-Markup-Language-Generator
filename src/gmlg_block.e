note
	description: "GMLG_BLOCK application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_BLOCK

create
	make

feature {NONE}
	text: STRING
	style: STRING

feature {ANY}

	make(a_text: STRING; a_style: STRING)
		do
			text := a_text
			style := a_style
		end

	-- get_test
	-- @param: none
	-- @result: STRING - get text feature
	get_text: STRING
		do
			Result := text
		end

	-- get_style
	-- @param: none
	-- @result: STRING - get style feature
	get_style: STRING
		do
			Result := style
		end
end
