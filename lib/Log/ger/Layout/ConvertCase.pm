package Log::ger::Layout::ConvertCase;

# DATE
# DIST
# VERSION

use strict;
use warnings;

sub get_hooks {
    my %conf = @_;
    $conf{case} or die "Please specify case";
    $conf{case} =~ /\A(upper|lower)\z/
        or die "Invalid value for 'case', please use 'upper' or 'lower'";
    return {
        create_layouter => [
            __PACKAGE__, # key
            50,          # priority
            sub {        # hook
                my %hook_args = @_;

                my $layouter = sub {
                    $conf{case} eq 'upper' ? uc($_[0]) : lc($_[0]);
                };

                [$layouter];
            },
        ],
    };
}

1;
# ABSTRACT: Example layout plugin to convert the case of message

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Log::ger::Layout ConvertCase => (
     case => 'upper',
 );
 use Log::ger;

 log_warn "hello, world";

The final message will be:

 HELLO, WORLD


=head1 DESCRIPTION

This is an example layout plugin, mentioned in the Log::ger tutorial.


=head1 SEE ALSO

L<Log::ger>

L<Log::ger::Manual::Tutorial>

=cut
