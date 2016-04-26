#!/usr/bin/perl/5.18 -w

use strict;

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

#remove unknowns
my @unknown;
my @no_unknowns;
foreach my $record (@data) {
	if ($record =~ m/\,\,/s ){
		push @unknown, $record;
	}else{
		push @no_unknowns, $record;
	}
}

#remove non-smokers
my @smokers;
my @non_smokers;

foreach my $record (@no_unknowns) {
	if ($record =~ m/no|denies/ism){
		push @non_smokers, $record;
	}else{
		push @smokers, $record;
	}
}

#identify light smokers
my @light_smokers;
my @non_light_smokers;

foreach my $record (@smokers) {
	if ($record =~ m/pack . day/ism){
		push @light_smokers, $record;
	}else{
		push @non_light_smokers, $record;
	}
}

#heavy smokers
my @heavy_smokers;
my @non_heavy_smokers;

foreach my $record (@non_light_smokers) {
	if ($record =~ m/. packs . day/ism){
		push @heavy_smokers, $record;
	}else{
		push @non_heavy_smokers, $record;
	}
}

#intermittent smokers
my @int_smokers;
my @non_int_smokers;

foreach my $record (@non_heavy_smokers) {
	if ($record =~ m/(pack|cig)*(week|month)/ism){
		push @int_smokers, $record;
	}else{
		push @non_int_smokers, $record;
	}
}


#past smokers
my @past_smokers;
my @current_smokers;

foreach my $record (@non_int_smokers) {
	if ($record =~ m/smoked|quit|used to/ism){
		push @past_smokers, $record;
	}else{
		push @current_smokers, $record;
	}
}
print @past_smokers;
print @int_smokers;