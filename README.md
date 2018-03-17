# Great Markup Language Generator (GMLG)
A generator for Markup-Language code generation written in Eiffel.
Currently supporting Markdown and HTML.

## Authors

* **Timucin Besken**- [TimP4w](https://github.com/TimP4w)
* **Maximilian Tornow**- [mtsummerbreeze](https://github.com/mtsummerbreeze)
* **Clara-Maria Barth**- [mariab19](https://github.com/mariab19)
* **Amadeo Charle**- [acharl](https://github.com/acharl)



## Supported Tags
* Link (Anchor, External, Local)
* Heading
* Image
* Linebreak
* Thematic Break
* List (ordered/unordered)
* Paragraph
* Table
* Snippet (provided by user, as is or inside a div)

## Usage
In your application add a local variable of type GMLG

### Create a page
Create a local variable for the page of type GMLG, then create a page with a title and a name (this should be the same as the filename you're going to  use) and then create the object.

```		
local
  page: GMLG
do 
  create p.make("A wonderful title", "name") -- create a page
end
```

### Add a tag
Once you have the page you can add all the tags
The tags are added on the page in the same order as the methods calls
```		
local
  page: GMLG
  img := GMLG_TAG
do 
  create p.make("A wonderful title", "name") -- create a page
  img := p.add_img("test.jpg")
end
```
the method {GMLG}.add_tag returns the tag created, so be sure to assign it to a variable of type GMLG_TAG in order to manipulate it later


### Tag manipulation
```		
local
  page: GMLG
  img := GMLG_TAG
do 
  create p.make("A wonderful title", "name") -- create a page
  img := p.add_img("test.jpg")
  img.set_height(100) -- this sets the height of the img to 100 px
end
```

### Get the code
simply call the method {GMLG}.generate_html_code or {GMLG}.generate_markdown_code. Those methods return a string.
```		
local
  page: GMLG
  img := GMLG_TAG
do 
  create p.make("A wonderful title", "name") -- create a page
  img := p.add_img("test.jpg")
  img.set_height(100) -- this sets the height of the img to 100 px
  print(p.generate_html_code) -- this prints the html code, you can also save it to a file
end
```

## Adding tags methods and tags specific methods
### Common methods for all tags
`{GMLG_TAG}.set_class(class: STRING)`	
it changes the class attribute of the tag.

### Image
`{GMLG}.add_img(src: STRING)`	
Returns object of type: GMLG_IMG 

#### Specific methods
`	image.set_width(width: INTEGER)`	
* min width: 5
* max width: 1024

`	image.set_height(height: INTEGER)`	
* min width: 5
* max width: 1024

### Link (Anchor, External, Local)
* `{GMLG}.add_anchor_link(a_text: STRING)`	 Returns object of type: GMLG_ANCHOR_LINK
* `{GMLG}.add_local_link(a_text: STRING)`	   Returns object of type: GMLG_LOCAL_LINK
* `{GMLG}.add_ext_link(a_text: STRING)`	     Returns object of type: GMLG_EXT_LINK

This adds an anchor link with text "a_text".

#### Specific Methods
`{GMLG_LINK}.link_to(src)`
Depending on the type of link you want to add src accepts different arguments:
* Anchor link: src: GMLG_TAG
* Local link: src: GMLG
* External Link: src: STRING

### Heading
`{GMLG}.add_heading(text: STRING; level: INTEGER)`

Adds a heading with text "text" of level "level"

Returns object of type: GMLG_HEADING

#### Specific methods
`{GMLG_PARAGRAPG}.set_italic` 
This sets the paragraph to italic

### Linebreak
`{GMLG}.add_linebreak`
Returns object of type: GMLG_LINEBREAK

### Thematic Break
`{GMLG}.add_thbr`
Returns object of type: GMLG_THEMATIC_BREAK

### List (ordered/unordered)
`{GMLG}.add_list(order: BOOLEAN)`
* Order True: ordered list
* Order False: unordered list

Returns object of type: GMLG_LIST

#### Specific methods
* `{GMLG_LIST}.add_content(tag: GMLG_TAG)` 
This sets the paragraph to italic
* `{GMLG_toggle_sorted}.add_content(tag: GMLG_TAG)`  <- this will be deleted
Toggle ordered/unordered


### Paragraph
`{GMLG}.add_paragraph` 
Returns object of type: GMLG_PARAGRAPH
#### Specific methods
`{GMLG_PARAGRAPH}.add_block(a_string :STRING; a_style: STRING)`

This adds a block of text in the paragraph with the wanted style.

Supported styles:
* bold
* italic
* underlined

If the style doesn't match any of those, the paragraph will be printed without a style

### Table
`{GMLG}.add_table(rows : INTEGER; cols : INTEGER)` 
Returns object of type: GMLG_TABLE

Create a table with specified rows and columns

#### Specific methods
`{GMLG_PARAGRAPG}.add_block(a_string :STRING; a_style: STRING)`
This adds a block of text in the paragraph with the wanted style.
Supported styles:
* bold
* italic
* underlined

`{GMLG_TABLE}.add_element(ele: GMLG_TAG; row, column: INTEGER)`
Adds a TAG as element of the table. 

Supported tags:			
* GMLG_ANCHOR_LINK
* GMLG_EXT_LINK
* GMLG_LOCAL_LINK
* GMLG_IMG
* GMLG_PARAGRAPH
* GMLG_SNIPPET
* GMLG_PARAGRAPH

To simplify adding numbers and strings, we provide those two methods:
* `{GMLG_TABLE}.add_number(ele: INTEGER; row, column: INTEGER)`
* `{GMLG_TABLE}.add_string(ele: STRING; row, column: INTEGER)`

### Snippet (provided by user, as is or inside a div)
`{GMLG}.add_snippet(code: STRING)` Returns object of type: GMLG_SNIPPET

#### Specific methods
`{GMLG_SNIPPET}.toggle_div` This will surround the snippet in a div

## License
This project is licensed under the MIT License.

Copyright (c) 2017 Timucin Besken, Clara-Maria Barth, Maximilian Tornow, Amadeo Charlé
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

