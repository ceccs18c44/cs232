#!/usr/bin/perl

# read the value
print "Enter the number\n";
$num = <>;
$flag=0;

for($i=2;$i <=$num/2;$i++)
{
	if($num%$i ==0)
	 {
 	  $flag=1;
    	  break;
	 }
}
if($flag==0)
{
	print "The number is prime";
}
else
{
	print "The number is not prime";
}

