# student-directory

## Check this out

**This is me training with bold text**
> hi i am quoting
_trying italic_
~~and strikethrough~~

For more information https://help.github.com/categories/writing-on-github/

Use `text within backticks` to call out code.

Use triple backticks before and after a block to format code or text into its own distinct block.  Some basic Git commands are:
```
git status
git add
git commit -m
```

### Creating a table
You can create tables with pipes | and hyphens -. Hyphens are used to create each column's header, while pipes separate each column. You must include a blank line before your table in order for it to correctly render.


| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

The pipes on either end of the table are optional.

Cells can vary in width and do not need to be perfectly aligned within columns. There must be at least three hyphens in each column of the header row.

| Command | Description |
| --- | --- |
| git status | List all new or modified files |
| git diff | Show file differences that haven't been staged |


### Syntax highlighting

You can add an optional language identifier to enable syntax highlighting in your fenced code block.

For example, to syntax highlight Ruby code, put "Ruby" next to the top triple backticks:

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```
