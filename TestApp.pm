package TestApp;
use strict;
use warnings;
use base qw/CGI::Application/;
use CGI::Application::Plugin::Routes;
sub setup {
	my $self = shift;

	$self->routes_table([
 		'' => 'home' ,
 		'/view/:name/:id/:email'  => 'view',
	]);
	$self->start_mode('show');

	$self->run_modes([qw/
		view
	/]);
	$self->tmpl_path('templates/');
}
sub view {
	my $self = shift;
	my $q = $self->query();
	my $name = $q->param('name');
	my $id = $q->param('id');
	my $email = $q->param('email');
	return $self->dump_html();
}
1;