# URI-FetchFile

Perl6 module to retrieve a file from the internet by the best available method

## Synopsis

```perl6

```

## Description

This provides a simple method of retrieving a single file via HTTP using the
best available method whilst trying to limit the dependencies.

It is intended to be used by installers or builders that may need to retrieve
a file but otherwise have no need for an HTTP client.

It will try to use the first available method from:

	* HTTP::UserAgent

	* LWP::Simple

	* Net::Curl

	* curl

	* wget

	* lynx

Please feel free to suggest and/or implement other mechanisms.

## Installation


## Support

Please make any reports, suggestions etc to https://github.com/jonathanstowe/URI-FetchFile/issues

## Licence and Copyright

© Jonathan Stowe 2016

This is free software please see the the [LICENCE](LICENCE) file for details.
