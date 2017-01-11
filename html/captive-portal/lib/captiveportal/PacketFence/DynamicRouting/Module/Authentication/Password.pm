package captiveportal::PacketFence::DynamicRouting::Module::Authentication::Password;

=head1 NAME

captiveportal::DynamicRouting::Module::Authentication::Password

=head1 DESCRIPTION

Login Controller with a predefined username for captiveportal

=cut

use Moose;
extends 'captiveportal::DynamicRouting::Module::Authentication::Login';

has '+username' => (is => 'rw');

=head2 required_fields_child

password is required for login

=cut

sub required_fields_child {
    return ["password"];
}

=head2 execute_child

Execute this module

=cut

sub execute_child {
    my ($self) = @_;
    if($self->app->request->method eq "POST"){
        if($self->app->request->path eq "challenge") {
            if( defined $self->challenge_data){
                $self->challenge();
            }
            else {
                $self->prompt_fields();
            }
        } else {
            $self->authenticate($self->username);
        }
    }
    else {
        if( defined $self->challenge_data){
            $self->display_challenge();
        }
        else {
            $self->prompt_fields();
        }
    }
};

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

__PACKAGE__->meta->make_immutable;

1;
