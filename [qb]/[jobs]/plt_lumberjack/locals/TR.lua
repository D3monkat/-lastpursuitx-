if not locals then locals ={} end
locals["TR"] = {
  ["uiTitle"]                  ="OASIS Odunculuk Meslekleri",
  ["uiCuttingTitle"]           ="Ağaç Kesim İşleri",
  ["uiCuttingComment"]         ="Motorlu testere ile ağaç kesim işlemleri ve Kesilmiş odunları kepçeli ile standa taşınması.",
  ["uiCuttingMoneyText"]       ="Her bir ağaç",
  ["uiStackingTitle"]          ="Kereste Paleti İstifleme",
  ["uiStackingComment"]        ="Kereste paletlerinin boş dorselere yerleştirilmesi veya forkliftin uygun dorseye park edilmesi.",
  ["uiStacking1MoneyText"]     ="Kereste İstifi",
  ["uiStacking2MoneyText"]     ="Forklift Park Etme",
  ["uiDeliveryTitle"]          ="İnşaata Kereste Teslimatı",
  ["uiDeliveryComment"]        ="Kerestelerin tır ile inşaata taşınması, teslim edilmesi ve tırın tekrar geri getirilmesi.",
  ["uiDelivery1MoneyText"]     ="Kereste Teslimatı",
  ["uiDelivery2MoneyText"]     ="Yol Giderleri Bonusu",
  ["uiJobOutfitTitle"]         ="İş Kıyafeti Giy",
  ["uiDailyOutfitTitle"]       ="Günlük Kıyafetini Giy",
  ["uiCancelJobTitle"]         ="İşi İptal Et&nbsp;",
  ["uiAlreadyWorking"]         ={type="error",duration=5000,text="Şu an zaten çalışıyorsun."},
  ["uiAlreadyNotWorking"]      ={type="error",duration=5000,text="Şu an zaten çalışmıyorsun."},
  ["uiCantThisJob"]            ={type="error",duration=5000,text="Bu mesleği yapmaya yetkin yok."},
  ["uiAlreadyWearJob"]         ={type="error",duration=5000,text="Zaten meslek kıyafetlerini giydin."},
  ["uiAlreadyWearDaily"]       ={type="error",duration=5000,text="Zatan üzerinde günlük kıyafetlerin var."},
  ["goForCuttableTree"]        ="İşe başlamak için Kesilebilir bir ağacın yanına git, Araçtan in ve kesmek istediğin ağaca yaklaş. Konumlarını GPS'ten bakabilirsin.",
  ["goForCutWood"]             ="Kesim işlemini yapmak için ağacın işaretli kısmına yaklaş.",
  ["needGetInTelehandler"]     ="işe devam etmek için kepçeye binmelisin.",
  ["needGetInForklift"]        ="İşe devam etmek için forklifte binmelisin.",
  ["needGetInTruck"]           ="işe devam etmek için tıra bin.",
  ["loadWoodToTelehandler"]    ="Kestiğin odunları kepçeye yükle.",
  ["forksNeedCloserToMarker"]  ="Kepçeyi oduna işaretteki gibi yaklaştır.",
  ["forksNeedParallelMarker"]  ="Kepçenin çatalları işaretteki gibi paralel olmalı.",
  ["dropWoodsLikeMarker"]      ="Odunları işaretli yere işaretteki gibi bırak.",
  ["moveWoodsToDeliveryPoint"] ="Odunları iş merkezindeki '%s' götür.",
  ["takeWoodOrParkForklift"]   ="İşaretli keresteli paleti forkliftle al yada forklifti işaretli olan tırın dorsesine çıkar ve parket.",
  ["goTakeWoodpile"]           ="İşaretli keresteli paleti forkliftle al.",
  ["goParkForklift"]           ="Forklifti işaretli olan tırın dorsesine çıkar ve parket. kereste yüklemek için müsait tır yok.",
  ["noMoreJobStacking"]        ="Bu departmanda yapılacak iş kalmadı. forklifti teslim edip işi tamamla.",
  ["slowDown"]                 ="Yavaşlayın...",
  ["forkliftParallelToTrailer"]="Forkliftin yönü dorse ile paralel olmalı.",
  ["parkForkliftLikeMarker"]   ="Forklifti dorseye parketmek için işaretteki gibi konumlandırın.",
  ["moveForksUpDown"]          ="Forkliftin çatallarını yukarı/aşağı haraket ettirin.",
  ["moveForksLikeMarker"]      ="Forkliftin çatallarını işaretteki gibi konumlandırın.",
  ["dropWoodPileToTrailer"]    ="Keresteli paleti işaretli bir tırın dorsesine yerleştir.",
  ["WoodpileParellelToTrailer"]="Keresteli palet dorse ile paralel olmalı.",
  ["moveWoodpileToMarker"]     ="Paleti yeşil alana tam şekilde yerleştir.",
  ["noTrailerDeliveryForklift"]="Kesteleri yükleyebileceğin bir tır kalmadı. forklifti teslim et.",
  ["attachTrailerToTruck"]     ="Dorseyi tıra takın.",
  ["goAnyConstructionDelivery"]="Keresteleri bir inşaata götürüp teslim et. İnşaat konumları(%s) gpsinde işaretlendi. Götüreceğin inşaatın uzaklığına bağlı olarak kazancın artacak.",
  ["noConstructionsInDistance"]="Yakınlarda bir inşaat yok veya bu inşaatın keresteye ihtiyacı yok. forklifti tıra geri parket.",
  ["getOutTrailerForDelivery"] ="Eğer keresteleri bu inşaata teslim etmek istiyorsanız; Tırı müsait bir yere parkedin. Keresteleri kolayca alabilmek için; düz bir zemine ve tır ile dorse paralel olacak şekilde park edin. bu inşaata teslimatınız için: '%s' teslimat ücreti, '%s' extra giderler için ödenecek.",
  ["getInForkliftTakeWoodpile"]="Keresteleri almak için forklifte binin.",
  ["takeWoodpileFromTrailer"]  ="Dorsedeki keresteyi al.",
  ["forkliftPerpenToTrailer"]  ="Forkliftin yönü dorseye dik olmalı.",
  ["MoveWoodpileLikeMarker"]   ="Kereste paletini yeşil işaretteki gibi yerleştir.",
  ["setWoodpileHeadingMarker"] ="Kereste paletininin yönü işaretteki gibi olmalı.",
  ["parkForliftToTrailer"]     ="Forklifti dorseye parket.",
  ["nearSeatShouldEmpty"]      ="Yan koltukta birisi var araçtan insin.",
  ["trailerParallelToTrailer"] ="Tır ile dorse paralel olmalı.",
  ["truckHeadingNeedParallel"] ="Aracın yönü işaretteki gibi olmalı.",
  ["parkTruckLikeMarker"]      ="İşaretli yere tırı işaretteki gibi parket.",
  ["goToJobCenter"]            ="İş merkezine geri dön ve araçları teslim et.",
  ["getOutOfForklift"]         ="Forkliftten inin.",
  ["clearAreaForWoodpile"]     ="Kereste paletinin ilerleyebilmesi için alanı bosaltin.",
  ["clearAreaForTruck"]        ="~w~Bu alan tır park alanı araç ile burada beklemeyin.Aracı buradan sakın bırakmayın!!!",
  ["interactionToAction"]      ={key=46,button={{"Etkileşim:", 46}},text ="İşlem yapmak için etkileşime geçin."},
  ["interactionToDelivery"]    ={key=46,button={{"Etkileşim:", 46}},text ="Tır teslimata çıkmaya hazır, inşaata keresteleri teslim etmek için işe başlamak istiyorsanız etkileşime geçin."},
  ["interactionCompltCutting"] ={key=46,button={{"Etkileşim:", 46}},text ="Kepçeyi teslim edip işi bitirmek istiyorsanız etkileşime geçin."},
  ["interactionWantCuttinTree"]={key=46,button={{"Etkileşim:", 46}},text ="Bu ağacı kesmek için etkileşime geçin."},
  ["interactionCuttinWood"]    ={key=46,button={{"Etkileşim:", 46}},text ="Kesim işlemine başlamak için etkileşime geçin."},
  ["interactionDropToWoodPile"]={key=46,button={{"Etkileşim:", 46}},text ="Keresteleri standa geri bırakmak için etkileşime geçin."},
  ["interactionCompltStacking"]={key=46,button={{"Etkileşim:", 46}},text ="Forklifti teslim edip işi bitirmek istiyorsanız etkileşime geçin."},
  ["interactionForUseForklift"]={key={33,32},button={{"Etkileşimler:", {33,32}}},text ="Forklifti kullanmak için etkikleşime geçin."},
  ["interactionForkliftToPark"]={key=46,button={{"Etkileşim:", 46}},text ="Forklifti dorseye sabitlemek için etkileşime geçin."},
  ["interactionCancelAnim"]    ={key=177,button={{"Etkileşimler :", {177,25,202}}},text ="İşlemi durdurup iptal etmek için etkileşime geçin. şuan motor ses seviyesi '%s' isterseniz değiştirebilirsiniz; '/%s 15.2'"},
  ["interactionForApprovePos"] ={key=46,button={{"Onayla", 46},{"Hızlandır", 21},{"",{207,208,109,108,110,111}}},text ="Ağacın bu pozisyona eklemek istermisiniz?"},
  ["interactionForAddAngle"]   ={key=46,button={{"Ekle:", 46},{"Ekleme:", 177}},text ="Ağacın bu açıda devrilmesini onaylıyormusunuz?"},
  ["interactionNewConsBlip"]   ={key=46,button={{"Etkileşim:", 46}},text ="İnşaatın blipini bu konuma eklemek için etkileşime geççin."},
  ["interactionNewConsFirst"]  ={key=46,button={{"Etkileşim:", 46}},text ="İlk kerestenin konumunu işaretteki gibi ayarlamak için etkileşime geçin."},
  ["interactionNewConsPos"]    ={key=46,button={{"Onayla",46},{"Bitir",73},{"Hızlandır",21},{"",{172,174,173,175,207,208,108,109,110,111,117,118,314}}},text ="Kerestenin Konumunu ayarlayın, onaylayın veya daha fazla eklemk istemiyorsanız bitirin."},
  ["interactionNewConsSide"]   ={key=46,button={{"Onayla",46},{"Hızlandır",21},{"",{172,173,174,175}}},text ="Yeni kereste hangi tarafta olacak seçin."},
  ["deliveyWoodToStand"]       ={type="error",  duration=10000,text="İşi bitirmek için kesmiş olduğunun odunları standa teslim etmelisin. '/%s'  gps'inde işaretli"},
  ["cantFellingThisHeading"]   ={type="error",  duration=15000,text="Ağacı devireceğin yönde bir araç var lütfen aracı çekin veya daha farklı yöne devirin."},
  ["startCuttingJob"]          ={type="inform", duration=15000,text="Rastgele bir ağaç GPS'inde işartlendi. isterseniz farklı bir ağacıda kesebilirsiniz."},
  ["startStackingJob"]         ={type="inform", duration=15000,text="İşaretli olan kereste paletini al işaretlenmiş bir tırın dorsesine yerleştir veya varsa forklifti işaretli bir tırın dorsesine yerleştir."},
  ["startDeliveryJob"]         ={type="inform", duration=15000,text="Rastgele bir inşaat GPS'inde işartlendi. isterseniz farklı bir inşaatada gidebilirsiniz."},
  ["vehicleSpawnPointsFull"]   ={type="error",  duration=10000,text="Tüm araç spawn noktaları dolu!"},
  ["noAnyWoodpile"]            ={type="error",  duration=10000,text="Şu an hazır kereste paleti yok."},
  ["woodpileCantloadToTruck"]  ={type="error",  duration=10000,text="Forklift park etmeye müsait tır yok."},
  ["forkliftCantPartToTruck"]  ={type="error",  duration=10000,text="Kereste yüklemeye müsait tır yok."},
  ["newChainSawVolume"]        ={type="inform", duration=20000,text="Yeni motorlu testere sesi '%s' olarak ayarlandı",},
  ["wrongChainSawVolume"]      ={type="warning",duration=20000,text="lütfen 0.0 ile 100 arasında bir sayı giriniz. örnek:'/%s 15.2'"},
  ["clothesForYou"]            ={type="error",  duration=10000,text="Size uygun kıyafet yok!"},
  ["jobCancelledDied"]         ={type="error",  duration=15000,text="!!! HATA Öldüğüniz için iş iptal edildi.!"},
  ["jobWillCancelAwayToCenter"]={type="warning",duration=4000 ,text="!!! UYARI İş merkezinden çok fazla uzaklaştın, Daha fazla uzaklaşırsan, İş iptal edilecek!"},
  ["jobWillCancelAwayToEntity"]={type="warning",duration=2000 ,text="!!! UYARI '%s'çok çfazla uzaklaştın!"},
  ["jobCancelledAwayToCenter"] ={type="error",  duration=25000,text="!!! HATA İş iptal edildi. çünkü iş merkezinden çok fazla uzaklaştın!"},
  ["jobCancelledAwayToEntity"] ={type="error",  duration=25000,text="!!! HATA İş iptal edildi. çünkü '%s'den çok fazla uzaklşatın!"},
  ["jobCancelledEntityNtFound"]={type="error",  duration=25000,text="!!! HATA İş iptal edildi, çünkü '%s' silindi!"},
  ["jobWillCancelEngine"]      ={type="warning",duration=2000 ,text="!!! UYARI '%s'un araç motoru çok fazla hasar aldı!"},
  ["jobCancelledEngine"]       ={type="error",  duration=25000,text="!!! HATA İş iptal edildi. çünkü '%s'un motoru çok fazla hasar aldı!"},
  ["jobWillCancelBody"]        ={type="warning",duration=15000,text="!!! UYARI '%s'un gövdesi fazla hasar aldı! eğer daha fazla hasar alırsa, iş iptal olabilir."},
  ["FailedToLoadAnim"]         ={type="error",  duration=25000,text="!!! HATA '%s' Animasyon yülenemedi, lütfen tüm stream dosylarını yüklediğinizden emin olun."},
  ["FailedToLoadProp"]         ={type="error",  duration=25000,text="!!! HATA '%s' Prop yülenemedi, lütfen tüm stream dosylarını yüklediğinizden emin olun.!"},
  ["FailedToLoadVehicle"]      ={type="error",  duration=25000,text="!!! HATA '%s' Araç yülenemedi, lütfen tüm stream dosylarını yüklediğinizden emin olun.!"},
  ["angleAdded"]               ={type="inform", duration=10000,text="'%s' açı eklendi."},
  ["angleNotAdded"]            ={type="warning",duration=10000,text="'%s' açı eklenmedi."},
  ["DatasCopied"]              ={type="success",duration=25000,text="Tablo Kopyalandı! Config.lua dosyasının en alt satır ekleyin. Ayrıca server konsolunada gönderildi isterseniz oradanm kopyalayabilirsiiniz."},
  ["alreadyHaveJob"]           ={type="error",  duration=10000,text="Şu anda zaten bir işle meşgulsün."},
  ["noAnyTruckForDelivery"]    ={type="error",  duration=10000,text="Şu anda teslimata hazır tır yok."},
  ["willPayCutting"]           ={type="inform", duration=15000,text="Ağaç kesim ve odun teslimatı için +'%s$' alacaksın. Kepçeyi teslim ettiğinde ödemen yapıalcak. İsterseniz gidip yeni bir ağaç kesebilirsiniz ve işe devam edebilirsiniz veya Kepçeyi teslim edip işi tamalayabilirsiniz."},
  ["willPayWoodpile"]          ={type="inform", duration=15000,text="Keresteleri dorseye yüklediğin için +'%s$' alacaksın. Ödemen forklifti teslim ettiğinde yapılacak."},
  ["willPayforklift"]          ={type="inform", duration=15000,text="Forklifti dorseye yüklediğin için +'%s$' alacaksın. Ödemen forklifti teslim ettiğinde yapılacak."},
  ["willPayGasolineFirst"]     ={type="inform", duration=15000,text="Bu inşaata getirdiğin için +'%s$' extra yol giderleri ödemesi alacaksın, İş merkezine tırı teslim ettiğinde ödemen yapılacak."},
  ["willPayGasolineSecond"]    ={type="inform", duration=15000,text="İş merkezine geri dönüşün için extra +'%s$' yol giderleri ödemesi alcaksın, İş merkezine tırı teslim ettiğinde ödemen yapılacak."},
  ["paidCutting"]              ={type="success",duration=25000,text="Ağaç kesim ve odun teslimatı işelerinden toplam +'%s$' ödeme aldın."},
  ["paidStacking"]             ={type="success",duration=25000,text="Kereste ve forklift yükleme işlemlerinden toplam +'%s$' ödeme aldın."},
  ["paidDelivery"]             ={type="success",duration=25000,text="İnşaata kereste teslimatı işinden +'%s$', yol giderlerin için +'%s$' ödeme aldın. Toplam kazancın: '%s$'"},
}