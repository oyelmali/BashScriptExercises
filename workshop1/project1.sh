#!/bin/bash

paramSayisi=$# 
dosyaSayisi=$2 
dosyaYolu=$1 
dosyaAdi=$(basename "$dosyaYolu") 
dosyaVar=false 
satirSayisi=$(cat Turkish.dic | wc -l) 
if [ -f "$dosyaYolu" ]; then 
	dosyaVar=true  
fi
if [ "$paramSayisi" -eq 2 ] && [ "$dosyaVar" = true ] && [ "$dosyaSayisi" -gt 0 ] && [ "$satirSayisi" -ge "$dosyaSayisi" ]; then 
	bolum=$((satirSayisi/dosyaSayisi)) 
	kalan=$((satirSayisi-dosyaSayisi*bolum)) 
	for (( i=1; i<=${dosyaSayisi}; i++ )); do 
		secici=$((i*bolum)) 
		dosyaAdiGecici="${dosyaAdi%.*}-$i.${dosyaAdi##*.}" 
		touch $dosyaAdiGecici 
		head -n $secici $dosyaYolu | tail -n $((secici/i)) > $dosyaAdiGecici 
		if [ "$i" -le "$kalan" ]; then 
			head -n $((secici + 1)) $dosyaYolu | tail -n 1 >> $dosyaAdiGecici 
		fi
	done
elif [ "$paramSayisi" -ne 2 ]; then 
	echo "2 adet arguman girmeniz gerekiyordu."
elif [ "$dosyaVar" = false ]; then 
	echo "Girdiginiz dosya bulunamadi."
elif [ "$dosyaSayisi" -le 0 ]; then 
	echo "Girdiginiz dosya sayisi pozitif sayi degildir."
elif [ "$satirSayisi" -lt "$dosyaSayisi" ]; then 
	echo "Giridiginiz dosya sayisi girdiğiniz dosyanin satir sayisindan fazladir."
fi
