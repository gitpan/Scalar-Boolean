use strict;
use warnings;

BEGIN {
    *Scalar::Boolean::booleanize   = \&Scalar::Boolean::booleanise;
    *Scalar::Boolean::unbooleanize = \&Scalar::Boolean::unbooleanise;
}

package Scalar::Boolean;

# ABSTRACT: Makes scalar variables store Boolean values only

use Tie::Scalar;

use base qw( Exporter Tie::StdScalar );
our @EXPORT = qw( booleanise booleanize unbooleanise unbooleanize );

sub STORE {
    my ( $ref, $value ) = @_;
    $$ref = $value ? 1 : 0;
    return;
}

sub TIESCALAR {
    my ( $class, $value ) = @_;
    $value = $value ? 1 : 0;
    return bless \$value, $class;
}

sub booleanise(\$;\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$) {
    tie $$_, __PACKAGE__, $$_ for @_;
    return;
}

sub unbooleanise(\$;\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$) {
    untie $$_ for @_;
    return;
}

1;



=pod

=head1 NAME

Scalar::Boolean - Makes scalar variables store Boolean values only

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    use Scalar::Boolean;

    booleanize my $value;  # you can even use `booleanise`
    $value = [];       # $value gets set to 1
    $value = 'Perl';   # $value gets set to 1
    $value = '';       # $value gets set to 0
    $value = '0';      # $value gets set to 0
    $value = undef;    # $value gets set to 0
    $value = ();       # $value gets set to 0

    unbooleanise $value;  # same as `unbooleanize`
    $value = 'foo';  # $value gets set to 'foo'
    …

=head1 METHODS

=head2 C<booleanise> or C<booleanize>

Accepts scalar variables which will be C<booleanise>d. Once C<booleanise>d,
the variable will convert all values that are assigned to it to their
corresponding Boolean values. No effect on already C<booleanise>d variables.

=head2 C<unbooleanise> or C<unbooleanize>

Accepts scalar variables which will be C<unbooleanise>d if already
C<booleanise>d. No effect on not already C<booleanise>d variables.

=encoding utf-8

=head1 AUTHOR

Alan Haggai Alavi <alanhaggai@alanhaggai.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Alan Haggai Alavi.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

