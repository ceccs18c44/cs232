pdftotext -layout result_CHN.pdf result_CHN.txt
grep --no-group-separator -A3 "CHN18CS" result_CHN.txt > result_cs.txt
tr '\n' ' ' < result_cs.txt >result_pp.txt
sed 's/\t//g' result_pp.txt>result_pa.txt
awk '{$1=$1; print}' result_pa.txt>result_pp.txt
sed 's/CHN/\nCHN/g' result_pp.txt>result_pa.txt
tr ',' ' ' <result_pa.txt>result.txt
sed -i 's/(O)/ 10/g' result.txt
sed -i 's/(A+)/ 9/g' result.txt
sed -i 's/(B+)/ 8.5/g' result.txt
sed -i 's/(B)/ 8/g' result.txt
sed -i 's/(C)/ 7/g' result.txt
sed -i 's/(P)/ 6/g' result.txt
sed -i 's/(F)/ 5/g' result.txt
sed -i 's/(FE)/ 0/g' result.txt
sed -i 's/(I)/ 0/g' result.txt
sed -i 's/(Absent)/ 0/g' result.txt
awk  '{
	print $1,$3,$5,$7,$9,$11,$13,$15,$17,$19
 }' result.txt > gp.txt
awk '{
	sum = 0
	flag = 0
	fails = 0
	for(var =2; var<=NF; var++)
	{
		if($var == 0)
		{
			flag = 1
			fails = fails + 1
		}
		sum += $var
	}
	cgpa = sum/9
	if (flag == 0) {
	 	printf("%s %0.2f\n",$1,cgpa)
	}
	if (flag == 1) {
		printf("%s failed in %d\n",$1,fails)
	}
}' gp.txt > cgpa_raw.txt



join students.txt cgpa_raw.txt > cgpa.txt








