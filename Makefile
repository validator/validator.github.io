HTML2MARKDOWN=html2text
PERL=perl
PERLFLAGS=

all: README.md

README.md: index.html
	$(HTML2MARKDOWN) $(HTML2MARKDOWNFLAGS) $< > $@
	$(PERL) $(PERLFLAGS) -pi -e 'undef $$/;s/Command-line: usage · options \| Web-based: usage · client · options\n//' $@
	$(PERL) $(PERLFLAGS) -pi -e 'undef $$/; s/\n\n\n(\n)*/\n\n/g' $@
