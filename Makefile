include config.mk

default: clean
	cat src/*.css >> $(OFILE)

clean:
	rm -f $(OFILE) $(OFILEMIN)

minify:
	# strip comments
	sed 's/\/\*.*\*\///g' src/*.css >> $(OFILEMIN)
	# replace \n and 2 or more spaces
	sed -zi 's/\n\| \{2,\}//g' $(OFILEMIN)
	# sub colon+space with just colon
	sed -i 's/: /:/g' $(OFILEMIN)
	# sub comma+space with just comma
	sed -i 's/, /,/g' $(OFILEMIN)
	# sub space+curlyboi with just curlyboi
	sed -i 's/ {/{/g' $(OFILEMIN)
	# sub semi-colon+space
	sed -i 's/; /;/g' $(OFILEMIN)

.PHONY: default clean min
