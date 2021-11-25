#!/usr/bin/perl

# Pragmas
use utf8;
use v5.10;
use warnings;
use diagnostics;

# User input
print "Enter some text: ";
chomp($text = <STDIN>);
# Reverse the text
$text = reverse($text);
# return the reversed text
say 'Reversed text: '.$text;
