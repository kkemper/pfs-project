 # Simple functional interface
    use Text::CSV::Hashify;
	# Request the spreadsheet
	print "Please provide the source file location: ";

	my $input = <STDIN>;
	chomp $input;
	
	print "Which row contains your primary key?: ";
	my $primary_key = <STDIN>;
	chomp $primary_key;

   $obj = Text::CSV::Hashify->new( {
        file        => $input,
        format      => 'hoh', 
        key         => $primary_key,  
   	} );
	$hash_ref = $obj->all;
	%data = %$hash_ref;
	print %data;
	%data2 = %{%data};
	print "data 2: ";
	
	while ( ($key, $value) = each %data)
		{
			$value = %value;
			
			while ( ($key, $value) = each %data)
				{
				  print "key: $key, value: $hash{$key}\n";
				}
		}


	