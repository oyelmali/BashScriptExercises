BEGIN{FS=";";uzunluk=0;dersAdi;yariYil;} #sütunların ";" ile ayrıldığını belirtildi ve değişken değerleri verildi
$1<=8 && length($3)>uzunluk{ #pattern tanımlandı gerekli koşullar sağlanırsa içerdeki actionları gerçekleştir
	dersAdi=$3; #ders adını değişkene atar
	yariYil=$1; #dersin verildiği yarıyılı değişkene atar
	uzunluk=length($3); #uzunluk değişkenindeki değeri yeniler
}
END{
	print "En uzun dersin adı : ",dersAdi; #ders adını yazdırır
	print "En uzun ders adinin bulunduğu yarıyıl : ",yariYil; #ders yarıyılını yazdırır
}

