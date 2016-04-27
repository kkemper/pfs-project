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

my @unknown;
my @no_unknowns;
my @annotations;
foreach my $record (@data) {
	if ($record =~ m/\,\,/s ){
		push @unknown, $record;
	}else{
		push @no_unknowns, $record;
	}
}
foreach my $item (@unknown){
		chomp $item;
		my $annotation = "$item,6 \n";
		push @annotations, $annotation;
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
foreach my $item (@non_smokers){
		chomp $item;
		my $annotation = "$item,0\n";
		push @annotations, $annotation;
}

#identify light smokers
my @light_smokers;
my @non_light_smokers;

foreach my $record (@smokers) {
	if ($record =~ m/. pack * day|week|year|month|1 pack . day/ism){
		push @light_smokers, $record;
	}else{
		push @non_light_smokers, $record;
	}
}
foreach my $item (@light_smokers){
		chomp $item;
		my $annotation = "$item,1\n";
		push @annotations, $annotation;
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
foreach my $item (@heavy_smokers){
		chomp $item;
		my $annotation = "$item,3\n";
		push @annotations, $annotation;
}

#intermittent smokers
my @int_smokers;
my @non_int_smokers;

foreach my $record (@non_heavy_smokers) {
	if ($record =~ m/occaision*|social*/ism){
		push @int_smokers, $record;
	}else{
		push @non_int_smokers, $record;
	}
}

foreach my $item (@int_smokers){
		chomp $item;
		my $annotation = "$item,2\n";
		push @annotations, $annotation;
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
foreach my $item (@past_smokers){
		chomp $item;
		my $annotation = "$item,5\n";
		push @annotations, $annotation;
}
foreach my $item (@current_smokers){
		chomp $item;
		my $annotation = "$item,4\n";
		push @annotations, $annotation;
}


my $output = "processed_data.csv";
if (open(PROCESSED, ">$output")){
	print PROCESSED "$_\n" for @annotations;
	print "File: processed_data.csv has been created \n";
	close PROCESSED;
}
else {
	print "Cannot open the output file \n";
	exit;
};
