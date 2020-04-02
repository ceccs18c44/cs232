#!/bin/bash
echo "....MENU DRIVEN CALCULATOR...."
sum=0
i="yes"
echo "Enter the first number"
read n1
echo "Enter the second number"
read n2
while [ $i = "yes" ]
do
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "5. Modulus"
echo "***** ENTER YOUR CHOICE *****"
read ch
case $ch in
1) sum=`expr $n1 + $n2`
echo "Sum = "$sum;;
2) sum=`expr $n1 - $n2`
echo "Difference = "$sum;;
3) sum=`expr $n1 \* $n2`
echo "Product = "$sum;;
4) sum=`expr $n1 / $n2`
echo "Quotient = "$sum;;
5) sum=`expr $n1 % $n2`
echo "Remainder = "$sum;;
*)echo "***** INVALID CHOICE *****"
esac
echo "Do you want to continue?"
read i
if [ $i != "yes" ]
then
exit
fi
done
