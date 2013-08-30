# How to use the vnu.jar validator

The `vnu.jar` validator is a packaged standalone version of the
[validator.nu][1] code. The [latest version][2] is available from the [validator
area at github][3]. The following are instructions on how to use it to validate
documents.

   [1]: http://about.validator.nu/

   [2]: https://github.com/validator/validator.github.io/releases

   [3]: https://github.com/validator/validator.github.io/

Command-line: usage · options | Web-based: usage · client · options

## Command-line usage

You can use the `vnu.jar` validator as an executable for command-line validation
of HTML documents by invoking it like this:

      java -jar vnu.jar [--html] [--entities] [--schema URL]

          [--format gnu|xml|json|text] [--verbose] [--version] FILES

To validate one or more documents from the command line:

      java -jar vnu.jar FILE.html FILE2.html FILE3.HTML FILE4.html...

To validate all HTML documents in a particular directory:

      java -jar vnu.jar some-directory-name/

To validate a Web document:

      java -jar vnu.jar http://example.com/foo

### Command-line options

When used from the command line as described in this section, the `vnu.jar`
executable provides the following options:

#### --entities

    Specifies that the XML parser must not load remote/external entities (such

    as DTDs) from the Internet.

    default: [unset; the XML parser will attempt to load external entities]

#### --format format

    Specifies the output format for validation results.

    default: "gnu"

    possible values: "gnu", "xml", "json", "text"

    see also:
[http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters#out][4]

   [4]: http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters#out

#### --html

    Specifies that all documents must be parsed by the HTML parser as text/html

    (otherwise, *.xhtml documents are parsed by the XML parser).

    default: [unset; *.xhtml documents are parsed by the XML parser]

#### --schema URL

    Specifies a URL for a known http://s.validator.nu/* schema to use for

    document validation.

    default: http://s.validator.nu/html5-all.rnc

#### --verbose

    Specifies that the validator output should be "verbose". Currently this

    just means that the names of files being validated are written to stdout.

    default: [unset; output is not verbose]

#### --version

    Shows validator version number.

## Web-based usage

The `vnu.jar` validator provides a way for you to validate HTML documents over
the Web, in a Web browser, as an HTTP service—just as with
[http://html5.validator.nu/][5] and [http://validator.w3.org/nu/][6].

   [5]: http://html5.validator.nu/

   [6]: http://validator.w3.org/nu/

To run the validator as an HTTP service, open a new terminal window and invoke
`vnu.jar` like this:

      java -cp vnu.jar nu.validator.servlet.Main 8888

Then open [http://localhost:8888][7] in a browser. (To have the validator listen
on a different port, replace `8888` with the port number.)

   [7]: http://localhost:8888

You’ll see a form similar to [http://validator.w3.org/nu/][8] that allows you to
type in the URL of an HTML document and have the validation results for that
document displayed in the browser.

   [8]: http://validator.w3.org/nu/

## HTTP client (for fast command-line validation)

You can also use `vnu.jar` from the command line to send HTML documents to a
locally-running instance of the HTTP service for validation. To validate
documents in that way, do this:

  1. Open a new terminal window and start up the validator as an HTTP service,
as described in the Web-based usage section.

  2. Open a second new terminal window and invoke `vnu.jar` like this:

      java -cp vnu.jar nu.validator.client.HttpClient FILE.html...

### HTTP client options

When using the `vnu.jar` for sending documents to a locally-running instance of
the validator HTTP service for validation, you can set Java system properties to
control configuration options for the validation behavior.

For example, you can suppress warning-level validation messages and only show
error-level ones by setting the value of the `nu.validator.client.level` system
property to `error`, like this:

       java -Dnu.validator.client.level=error\

           -cp vnu.jar nu.validator.client.HttpClient FILE.html...

Most of the properties listed below map to the validator.nu common input
parameters documented at
[http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters][9].

   [9]: http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters

#### nu.validator.client.host

    Specifies the hostname of the validator for the client to connect to.

    default: "127.0.0.1"

#### nu.validator.client.port

    Specifies the hostname of the validator for the client to connect to.

    default: "8888"

    example: java -Dnu.validator.client.port=8080 -jar vnu.jar FILE.html

#### nu.validator.client.level

    Specifies the severity level of validation messages to report; to

    suppress warning-level messages, and only show error-level ones, set

    this property to "error".

    default: [unset]

    possible values: "error"

    example: java -Dnu.validator.client.level=error -jar vnu.jar FILE.html

#### nu.validator.client.parser

    Specifies which parser to use.

    default: "html"; or, for *.xhtml input files, "xml"

    possible values: see
[http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters#parser][10]

   [10]: http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters#parser

#### nu.validator.client.charset

    Specifies the encoding of the input document.

    default: [unset]

#### nu.validator.client.content-type

    Specifies the content-type of the input document.

    default: "text/html"; or, for *.xhtml files, "application/xhtml+xml"

#### nu.validator.client.out

    Specifies the output format for validation messages.

    default: "gnu"

    possible values: see
[http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters#out][11]

   [11]: http://wiki.whatwg.org/wiki/Validator.nu_Common_Input_Parameters#out

#### nu.validator.client.asciiquotes

    Specifies whether ASCII quotation marks are substituted for Unicode

    smart quotation marks in validation messages.

    default: "yes"

    possible values: "yes" or "no"

For more information... sources bugz etc.

