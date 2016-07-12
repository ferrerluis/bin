# ferrer bin

This is my personal bin with the Unix commands that make my life in the terminal easier!

## filify

Do you also hate spaces and weird characters in your file names? Do you have to write an essay and don't know what file name to use?

#### Usage
`filify Harry Potter and the Chamber of Secrets`
#### Result
`harry_potter_and_the_chamber_of_secrets`

## markdown

This is just a Python script that receives markdown-formatted text either from a file or from the pipe, and prints its HTML equivalent. It uses the markdown library for Python.

#### Usage
`echo '## hello' | markdown` or `markdown file.md` (where file.md contains `## hello`)
#### Result
`<h2>hello</h2>`

## trash

This is my trash command. Don't you hate it when you `rm` something and then it's lost forever? `trash` replaces `rm` in that instead of removing, it moves the files to your ~/.Trash directory. You can always `rm` the whole trash can later anyway!

Oh! BTW. If you don't have a ~/.Trash directory, it will create one for you!

#### Usage
`trash not_useful.html` or `trash item1.txt item2.md item3.py`
#### Result
Nothing. But check your .Trash directory and your files will be there!

## csvfy

Do you work with databases and want to be able to share the values in them easily with other people? Just convert your tables to CSV so you can open them with a GUI editor like Microsoft Excel, create graphics, and share the information with non-technical people.

#### Usage
`csvfy sqlite example.db some_table file_to_save.out`

#### Result
This will save the contents of the table `some_table` into the file `file_to_save.out` when using a SQLite database. SQLite is the only databse supported right now. More will be added in the future, or you can add support to more of them and submit a pull request :)!
