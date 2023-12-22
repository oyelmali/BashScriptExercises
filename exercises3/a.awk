#OMER YUSUF #ELMALI #190707083 #BİLGİSAYAR MÜHENDİSLĞİ #KABUK PROGRAMLAMA #BIS-301-50-50 #2021-2022-GÜZ #PROJE3 #DENİZDAL
BEGIN{FS=";";toplam=0} #sütunlar ; ile ayrılır. toplam değişkenine değer verilir.
{
	toplam=toplam+$6 #her satırda toplam değişkenine 6. sütundaki değer atanır.
}
END{print "Mezun olan öğrencinin toplam aldığı kredi :",toplam} #kredi toplamını ekrana yazdırır.
