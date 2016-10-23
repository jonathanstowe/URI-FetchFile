use v6.c;

=begin pod

=head1 NAME

URI::FetchFile - retrieve a file from the internet by any means necessary

=head1 SYNOPSIS

=head1 DESCRIPTION

This provides a simple method of retrieving a single file via HTTP using the
best available method whilst trying to limit the dependencies.

It is intended to be used by installers or builders that may need to retrieve
a file but otherwise have no need for an HTTP client.

It will try to use the first available method from:

=item HTTP::UserAgent

=item LWP::Simple

=item Net::Curl

=item curl

=item wget

=item lynx

Failing if it can't use any of them.

=end pod

class URI::FetchFile {

    role Provider {

    }


}
# vim: expandtab shiftwidth=4 ft=perl6
