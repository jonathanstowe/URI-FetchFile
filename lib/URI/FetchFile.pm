use v6.c;

use File::Which;

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
        method fetch(Provider:U: :$uri, :$file) returns Bool {
            ...
        }

        method is-available() returns Bool {
            ...
        }
    }

    class X::NotFound is Exception {
    }

    role Executable[Str $executable-name] {

        my Str $executable;

        method executable-name() returns Str {
            $executable-name;
        }

        method executable() returns Str {
            if ! $executable.defined {
                $executable = which($executable-name);
            }
            $executable;
        }

        method is-available() returns Bool {
            so $.executable;
        }

    }

    class Provider::Curl does Executable['curl'] does Provider {
        method fetch(:$uri, :$file) returns Bool {
            my $rc = False;
            if $.is-available {
                my $p = run($.executable,'-f', '-s', '-o', $file, $uri );
                if !$p.exitcode {
                    $rc = True;
                }
            }
            return $rc;
        }
    }

    class Provider::Wget does Executable['wget'] does Provider {
        method fetch(:$uri, :$file) returns Bool {
            my $rc = False;
            if $.is-available {
                my $p = run($.executable,'-q', '-O', $file, $uri );
                if !$p.exitcode {
                    $rc = True;
                }
                else {
                    # wget will create the file even if it doesn't retrieve anything
                    $file.IO.unlink if $file.IO.e;
                }
            }
            return $rc;
        }
    }

}
# vim: expandtab shiftwidth=4 ft=perl6
