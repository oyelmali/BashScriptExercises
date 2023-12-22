#OMER YUSUF #ELMALI #190707083 #BİLGİSAYAR MÜHENDİSLĞİ #KABUK PROGRAMLAMA #BIS-301-50-50 #2021-2022-GÜZ #PROJE3 #DENİZDAL
BEGIN{FS=";";dersSayisi=0} #noktalı virgül ile sütunları ayırılır ve değişken değeri verilir
{
	if( $1>8 && /BM/ ) #8. yarıyıldan büyük ve satırda BM değeri varsa dersSayisi değişkenini 1 artırır.
		dersSayisi++
}
END{print "8. yarıyıldan sonra BM kodlu ",dersSayisi,"tane seçmeliders vardır"} #ders sayısını ekrana yazdırır.
