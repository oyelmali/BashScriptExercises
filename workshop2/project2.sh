#!/bin/bash

function IzogramMi { 
	word=$1
	izogramMi=true 
	length=${#word}
	for (( i=1; i<=$length; i++ )); 
	do
		for (( j=1; j<=(($length-1)); j++ ));
		do
			if [[ i -eq j ]]; 
			then
				continue
			elif [[ ${word:i-1:1} = ${word:j-1:1} ]]; 
			then
				izogramMi=false
				break
			else
				izogramMi=true
			fi
		done
		if [ "$izogramMi" = false ]; 
		then
			break
		fi
	done
	if [ "$izogramMi" = true ]; 
	then
		return 0
	else
		return 1
	fi
}


function PolindromMu { 
	word=$1
	polindromMu=true
	length=${#word}
	for (( i=1; i<=(($length/2)); i++)); 
	do
		if [[ ${word:i-1:1} = ${word:length-i:1} ]]; 
		then
			polinromMu=true
		else			
			polindromMu=false
			break
		fi
	done
	if [ "$polindromMu" = true ]; 
	then
		return 0
	else
		return 1
	fi
}


paramSayisi=$#
dosyaYolu=$1
dosyaAdi=$(basename "$dosyaYolu") 
dosyaVar=false
enUzunKelime=" "
kelimeSayisi=$(wc -w $dosyaYolu | cut -d ' ' -f1) 
if [ -f "$dosyaYolu" ]; 
then
	dosyaVar=true
fi

if [ "$dosyaVar" = true ] && [ "$paramSayisi" -eq 1 ]; 
then
	lines=$(cat $dosyaYolu | sed 's/[[:punct:]]//g' | sed 's/[[:digit:]]//g') 
	for line in $lines 
	do
		for word in $line 
		do
			len=${#word}
			uzun=${#enUzunKelime}
			IzogramMi $word 
			if [ $? -eq 0 ]; 
			then
				if [[ "$uzun" -lt "$len" ]]; 
				then
					enUzunKelime=$word
				fi
				((izogramSayisi++))
			fi
			PolindromMu $word 
			if [ $? -eq 0 ]; 
			then
				if [[ "$uzun" -lt "$len" ]]; 
				then
					enUzunPolindrom=$word
				fi
				((polindromSayisi++))
			fi
		done
	done
	echo "polindrom en uzun : " "$enUzunPolindrom"
	echo "En uzun polindrom veya izogram kelime : " "$enUzunKelime"
	echo "İşlem yapılan dosyanın içerdiği kelime sayısı : " $kelimeSayisi
	echo "Analiz edilen Polindrom kelime sayısı : " $polindromSayisi
	echo "Analiz edilen İzogram kelime sayısı : " $izogramSayisi
elif [ "$paramSayisi" -ne 1 ]; 
	echo "1 adet argüman girmeniz gerekiyor."
elif [ "$dosyaVar" = false ]; 
then
	echo "Girdiğiniz dosya bulunamadı."
fi
