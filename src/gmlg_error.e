note
	description: "Summary description for {GMLG_ERROR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GMLG_ERROR

create
	make

feature { NONE }
	severity: INTEGER
	description: STRING
	type: STRING
	context: STRING

feature {ANY}
	make(a_severity: INTEGER; a_description, a_type, a_context: STRING)
		do
			severity := a_severity
			description := a_description
			type := a_type
			context := a_context
		end

	print_error
		local
			error: STRING
		do
			error := ""
			error.append ("An error ocurred while " + context + "%N")
			error.append ("Error Type: " + type + "%N")
			error.append ("Error Description: " + description + "%N" )
			error.append ("Severity: " + severity.out + "%N")
			error.append ("Please solve those issue before using the outputted. %N")
			print (error)
		end

end
