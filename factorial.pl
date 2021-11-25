#!/usr/bin/perl

# Pragmas
use utf8;
use v5.10;
use warnings;
use diagnostics;

# Factorial Function
sub factorial
{
    if($_[0] > -1)
    {
        if($_[0] == 1 || $_[0] == 0)
        {
            return 1;
        }
        else
        {
            return ($_[0] * &factorial($_[0]-1));
        }
    }
    else
    {
        print "The N value should not be negative.";
        return -1;
    }
};

print("enter a value: ");
chomp($val = <STDIN>);
say '';
$val = &factorial($val);
say $val;
