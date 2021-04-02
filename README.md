# URI-FetchFile

Raku module to retrieve a file from the internet by the best available method

![Build Status](https://github.com/jonathanstowe/URI-FetchFile/workflows/CI/badge.svg)

## Synopsis

```raku

use URI::FetchFile;

if fetch-uri('http://rakudo.org/downloads/star/rakudo-star-2016.10.tar.gz', 'rakudo-star-2016.10.tar.gz') {
    # do something with the file
}
else {
    die "couldn't get file";
}

```

## Description

This provides a simple method of retrieving a single file via HTTP using the
best available method whilst trying to limit the dependencies.

It is intended to be used by installers or builders that may need to retrieve
a file but otherwise have no need for an HTTP client.

It will try to use the first available method from:

	* HTTP::UserAgent

	* LWP::Simple

	* curl

	* wget


Please feel free to suggest and/or implement other mechanisms.

## Installation

Assuming you have a working installation of Rakudo you can install this using ```zef``` : 

	zef install URI::FetchFile

Other mechanisms may become available in the future.

## Support

Please make any reports, suggestions etc to [Github](https://github.com/jonathanstowe/URI-FetchFile/issues)

## Licence and Copyright

This is free software please see the the [LICENCE](LICENCE) file for details.

© Jonathan Stowe 2016 - 2021
