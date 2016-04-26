#!/usr/bin/perl/5.18 -w

use strict;
use Data::Dumper;

#Get csv
print "Please provide the source file location: ";

my $input = <STDIN>;
chomp $input;

#Confirm file
if (open(SOURCE, $input)){
	print "File loaded successfully. \n";
	}
	else {print "Cannot open the file! \n"};

#Add data to an array
my @data = <SOURCE>;
	
close SOURCE;

print data;
my @records;
foreach my $record (@data) {
	split(',', $record);
	push @records, $record;
}

print $records[2];

