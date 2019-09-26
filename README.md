**Kullanım**

	./pardus_build_iso.sh

* preseed.cfg:	Standart Pardus 19 iso ayarlarını içeren preseed dosyası
* debian-preseed.cfg: Debian Buster örnek preseed dosyası
* preseed-omer.cfg: Kendi ayarlarımı içerek örnek preseed dosyası

! Bu betik bir defa çalıştırıldıktan sonra **pardus_build_iso.sh** betik dosyasında **apt** ve **wget** ile başlayan satırların başına "#" koyulmalıdır.

Betik çalıştırıldığında bulunduğu dizine iso dosyasını çıkarır. Tüm değişiklikler sadece **preseed.cfg** dosyasında yapılmalıdır. Yukarıdaki örnek preseed dosyalarını inceleyerek kendi dosyanızı oluşturabilirsiniz.

