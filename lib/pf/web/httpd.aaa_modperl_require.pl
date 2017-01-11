#!/usr/bin/perl
=head1 NAME

aaa_modperl_require

=cut

=head1 DESCRIPTION

aaa_modperl_require

=cut

BEGIN {
    use lib "/usr/local/pf/lib";
    use pf::log 'service' => 'httpd.aaa', reinit => 1;
}

use pf::config();
use pf::node();
use pf::locationlog();
use pf::iplog();
use pf::violation();
use pf::util();
use pf::radius::custom();
use pf::soh::custom();

1;

=head1 AUTHOR

Inverse inc. <info@inverse.ca>

=head1 COPYRIGHT

Copyright (C) 2005-2017 Inverse inc.

=head1 LICENSE

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA.

=cut

