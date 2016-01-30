#!/usr/bin/python

from markdown import markdown, markdownFromFile
from fileinput import input as pipe

text = ''.join([line for line in pipe()])

if text:
	print markdown(text)
else:
	print "Please pipe input to command or specify a file to take the text from."
