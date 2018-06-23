#!/usr/bin/perl

package IAS::DataStructure::Browser;

use JSON;
use Hash::Merge::Simple;
use Data::Dumper;

our @JSON_TYPES = qw(
	object
	array
	value
	string
	number
);



sub new
{
	my $type = shift;
	my $self = {};

	$self->{structure} = undef; 

	return bless $self, $type;
}

sub command_loop
{
	my ($self) = @_;

	while(1)
	{
		my $command = '';
		while(
			$command eq '' ||
			$command =~ m/\\$/
		)
		{
			$command =~ s/\\$//;
			$command .= <STDIN>;
			chomp($command);

		}
		# print "Command: $command\n";
		$command =~ s/^\s*//;
		$command =~ s/\s*$//;
		
		my @command_parts = split(/\s+/, $command, 2);
		
		$self->process_command(\@command_parts);
		
	}	
}

sub process_command
{
	my ($self, $command_parts_ar) = @_;
	
	print Dumper($command_parts_ar),$/;
}
1;
