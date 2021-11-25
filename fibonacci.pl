#!/usr/bin/perl

# Pragmas
use utf8;
use v5.10;
use diagnostics;
use warnings;

# Functions
sub fibonacci
{
	if($_[0] == 1||$_[0] == 0)
	{
		$fib_val = $_[0];
	}
	else
	{
		$fib_val = (fibonacci($_[0]-1) + fibonacci($_[0]-2));
	}
	return $fib_val;
}

# Main Program
print "Enter the N value: ";
chomp($input = <STDIN>);
say '';
$fibstr = &fibonacci($input);
say "the Nth number of the Fibonacci Sequence is ".$fibstr;
