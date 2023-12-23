BEGIN{FS=";";toplam=0;secmeliToplam=0} #sütunlar noktalı virgülle ayrılır ve değişken değerleri verilir
{
	toplam+=$6 #her satır da yapılacak olan bir action belirlenir.her satırın 6. sütunundaki değer değişkene eklenir
}
/MEL/{
	secmeliToplam+=$6 #içinde MEL olan satırlarda 6.sütunu değişkene ekler
}
END{printf("Seçmeli derslerin bütün derslere göre kredi yüzdesi : %.3f\n",(secmeliToplam/toplam)*100)} #oran belirlenir ve ekrana yazdırılır
