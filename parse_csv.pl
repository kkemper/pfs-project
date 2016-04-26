 # Simple functional interface
    use Text::CSV::Hashify;
	# Request the spreadsheet
	print "Please provide the source file location: ";

	my $input = <STDIN>;
	chomp $input;
	
#	print "Which row contains your primary key?: ";
#	my $primary_key = <STDIN>;
#	chomp $primary_key;
	
	if (open(SOURCE, $input)){
		print "File loaded successfully. \n";
	}
	else {print "Cannot open the file! \n"};
	
	@data = <SOURCE>;
	
	close SOURCE;
	
	print @data[0];

#   $obj = Text::CSV::Hashify->new( {
#        file        => $input,
#        format      => 'hoh', # hash of hashes, which is default
#        key         => $primary_key,  # needed except when format is 'aoh'
#   	} );
#	print %obj;
#	
#	while ( ($key, $value) = each %hash_ref)
#	{
#	  print "key: $key, value: $hash{$key}\n";
#	}