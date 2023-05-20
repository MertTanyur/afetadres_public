# earthquake_emergency


play store de yayimladim: afet adres(mor bı ikonu var)
## Requirements to run locally
Local flutter sdk installation, ios and android config for map and location plugins.

## Run, debug command
flutter run 


## Devlog
- [x] Dependency resolving
- [x] Defining classes.
- [x] UI is completed far or more less
- [x] UI lags while fetching and constructing data, need to use isolates, multithreading and clusters.



Api test, 
https://www.postman.com/dopamine-apis/workspace/earthquake/request/13567768-cd235aeb-16ba-42b8-be83-5a836295f363



api endpoints

[11:46, 2/14/2023] Barış Dincer Data Scientist Afet: Merhabalar,

Verilen tüm emekler içi ayrı ayrı teşekkür ederim. Sizlerle son API noktalarını paylaşayım, tüm başlıklara ait anlık veri çekiliyor, bu API ile anlık olarak besleyebiliriz, konum bilgileri de bulunuyor:

Erzak:
https://apigo.afetharita.com/feeds/areas?ne_lat=40.18726672309203&ne_lng=38.67187500000001&sw_lat=34.32529192442733&sw_lng=31.311035156250004&time_stamp=undefined&reason=erzak

Kurtarma:
https://apigo.afetharita.com/feeds/areas?ne_lat=40.18726672309203&ne_lng=38.67187500000001&sw_lat=34.32529192442733&sw_lng=31.311035156250004&time_stamp=undefined&reason=kurtarma

Yemek:
https://apigo.afetharita.com/feeds/areas?ne_lat=40.18726672309203&ne_lng=38.67187500000001&sw_lat=34.32529192442733&sw_lng=31.311035156250004&time_stamp=undefined&reason=…
[11:46, 2/14/2023] Barış Dincer Data Scientist Afet: Bu veri de ise yıkılan binaların koordinatları ve bina tipleri bulunuyor:

-->
https://www.kaggle.com/datasets/brsdincer/feb-06-23earthquake-turkey-citiesvectors
[11:47, 2/14/2023] Barış Dincer Data Scientist Afet: API için "reason" sınıfına ait diğer tag'leri de paylaşayım:

-enkaz
-kurtarma
-erzak
-yemek,giysi,su,barinma
-barinma,elektronik
-lojistik,kurtarma
-""
-barinma,lojistik,elektronik
-yemek,barinma,su,giysi,saglik
-saglik,barinma,yemek,su
-elektroniksaglik,su
-kurtarma,elektronik
[11:48, 2/14/2023] Barış Dincer Data Scientist Afet: Genel olarak "erzak, su, giysi, enkaz, kurtarma ve barinma" tag'leri daha çok önem arzediyor.


Burada da anlık olarak deprem verileri bulunuyor, API olarak hizmet görüyor:


http://service.iris.edu/fdsnws/event/1/query?starttime=2023-02-01&minlatitude=15&maxlatitude=40&minlongitude=-170&maxlongitude=170&minmagnitude=5&includeallmagnitudes=true&orderby=magnitude&format=geocsv



# To build

flutter run --profile --cache-sksl --purge-persistent-cache

flutter build appbundle --bundle-sksl-path flutter_05.sksl.json --no-tree-shake-icons


keytool -list -v -keystore /Users/merttanyur/upload-keystore.jks -alias upload
