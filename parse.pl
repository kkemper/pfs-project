#!/usr/bin/perl/5.18 -w

use strict;
use Spreadsheet::XSLX;

# Request the spreadsheet
print "Please provide the source file location: ";

my $excel = <STDIN>;
chomp $excel;

# Import .xlsx

 my $excel = Spreadsheet::XLSX -> new ('test.xlsx', $converter);
 
 foreach my $sheet (@{$excel -> {Worksheet}}) {
 
        printf("Sheet: %s\n", $sheet->{Name});
        
        $sheet -> {MaxRow} ||= $sheet -> {MinRow};
        
         foreach my $row ($sheet -> {MinRow} .. $sheet -> {MaxRow}) {
         
                $sheet -> {MaxCol} ||= $sheet -> {MinCol};
                
                foreach my $col ($sheet -> {MinCol} ..  $sheet -> {MaxCol}) {
                
                        my $cell = $sheet -> {Cells} [$row] [$col];
 
                        if ($cell) {
                            printf("( %s , %s ) => %s\n", $row, $col, $cell -> {Val});
                        }
 
                }
 
        }
 
 }



# Pass data to hash


# Iterate thruough hash to compare kit and jay