class NameModel{
 String arabic;
 String name;
 String desc;

  NameModel({required this.arabic,required this.name,required this.desc});
  // List<NameModel> list=[
  //   NameModel(arabic: "الرحمن", name: "Ar-Rohman", desc: "Mehribon — Ulugʻ neʼmatlarni beruvchi. Bu sifat faqat Allohga xos boʻlib, barchaga kofirga ham, moʻminga ham mehribon va neʼmat beruvchi maʼnosini anglatadi. Rahmon sifatini Alloh taolodan boshqa hech kimga nisbatan ishlatib boʻlmaydi."),
  //   NameModel(arabic: "الرحيم", name: "Ar-Rohim", desc: "Rahmli — „Rohiym“ latif neʼmatlarni beruvchi. Bu sifat xosroq boʻlib, qiyomat kuni faqat moʻminlarga rahm qiluvchi maʼnosini anglatadi. Va Allohdan oʻzgalarga, jumladan Paygʻambar alayhissalomga nisbatan ham ishlatiladi."),
  //   NameModel(arabic: "الملك", name: "Al-Malik", desc: "Podsho — Barcha narsani egasi.${"Malik"} haqiqiy egadir.Undan oʻzga ega yoqdir.Shuning uchun bandalar faqat unga qul boʻladilar. Hech vaqtda bir qulga ikki xoʻjayin boʻlmaydi.Shuning uchun insonlar oʻzlariga oʻxshagan insonlarga emas, balki yagona yaratganga, haqiqiy Malikka qul boʻlish lozim."),
  //   NameModel(arabic: "القدوس", name: "Al-Quddus", desc: "Muqaddas, nuqsonlardan holi — Barcha ayblardan xoli, noloyiq sifatlardan munazzah, mutlaq muqaddaslik va mutlaq poklik Allohning oʻzigagina hosdir."),
  //   NameModel(arabic: "السلام", name: "As-Salam", desc: "Ofat va balolardan salomat. Qutqarayotgan — „Salom“-barcha nuqsonlardan salomat. Shuningdek, tinchlik, xotirjamlik va rohat beruvchi degani. Alloh „Salom“ sifati ila bandalarga tinchlik, omonlik, xotirjamlik ato qiladi."),
  //   NameModel(arabic: "المؤمن", name: "Al-Mumin", desc: "Moʻmin-iymon va omonlik beruvchi."),
  //   NameModel(arabic: "المهيمن", name: "Al-Muhaymin", desc:"Hamma narsani qamrab oluvchi.Alloh bandalarning barcha holatlariga guvoh boʻlib turadi.Undan hech narsa maxfiy qolmaydi." ),
  //   NameModel(arabic: "العزيز", name: "Al-Aziz", desc: "Izzat va qudrat sohibi. Ulugʻ — Barchaning ustidan gʻolib. Undan biror narsa gʻolib kelolmaydi."),
  //   NameModel(arabic: "الجبار", name: "Al-Jabbar", desc: "Bandalarini ishlarini isloh etuvchi. Jabbor — oliy qadar ulugʻ, Uning oldida hamma oʻzini xor tutadi."),
  //   NameModel(arabic: "المتكبر", name: "Al-Mutakabbir", desc: "Kattalik yarashuvchi zot. Mutakabbir — kibriyosi va ulugʻligi behad. Uning oldida boshqalar qul boʻlib turadi."),
  //   NameModel(arabic: "الخالق", name: "Al-Xoliq", desc:"Yaratuvchi, vujudga keltiruvchi. Xoliq — Asli va oʻxshashi yoq narsaning oʻlchovini mos qilib yaratuvchi. Xoliq mutloq vujudga keltiruvchidir." ),
  //   NameModel(arabic: "البارئ", name: "Al-Bari", desc: "Bori' — Yoʻqdan paydo qiluvchi, vujudga keltiruvchi, yaratuvchi. Bori’ning vujudga keltirishida tafovut yoqdir."),
  //   NameModel(arabic: "المصور", name: "Al-Musovvir", desc:"Maxluqot va mavjudotlarga suvrat va shakl beruvchi."),
  //   NameModel(arabic: "الغفار", name: "Al-G'offar", desc: "Gʻaffor — Koʻplab magʻfirat qilib, bandalarning aybini oʻz fazli ila kechib yuboruvchi. bandalarning aybu nuqsonlari va gunohu maʼsiyatlarini fosh qilmay yopib turuvchi."),
  //   NameModel(arabic: "القهار", name: "Al-Qohhar", desc: "Qahhor — Barcha maxluqotlarni qabzasida tutib, ularni oʻz hukmiga yuritib va qudrati ila boʻysundirib turuvchi."),
  //   NameModel(arabic: "الوهاب", name: "Al-Vahhab", desc: "Oʻz neʼmatlarini tekin ato etuvchi."),
  //   NameModel(arabic: "الرزاق", name: "Ar-Rozzaq", desc: "Barcha tirik mavjudot rizqini yetkazib beruvchi."),
  // NameModel(arabic: "الفتاح", name: "Al-Fattah", desc: "Hukm etuvchi, rahmat hazinalarini ochuvchi."),
  //   NameModel(arabic: "العليم", name: "Al-Alim", desc: "Biluvchi, dono, ilm sohibi. Boʻlgan va boʻladigan, avvalgi va oxirgi, zohir va botin narsalarning barchasini biluvchi."),
  //   NameModel(arabic: "القابض", name: "Al-Qobiz", desc: "Kimlarningdir rizqini qiyuvchi, ruhlarni qabz etuvchi (oluvchi)."),
  //   NameModel(arabic: "الباسط", name: "Al-Basit", desc: "Kimlargadir keng rizq beruvchi, ruh baxsh etuvchi."),
  //   NameModel(arabic: "الخافض", name: "Al-Xofiz", desc: "Kofirlar martabasini tushiruvchi."),
  //   NameModel(arabic: "الرافع", name: "Ar-Rofi", desc: "Moʻminlar martabasini koʻtaruvchi."),
  //   NameModel(arabic: "المعز", name: "Al-Mu’izz", desc: "Kimlarnidir aziz, qadrli etuvchi."),
  //   NameModel(arabic: "المذل", name: "Al-Muzill", desc: "Kimlarnidur xoru zalil qiluvchi."),
  //   NameModel(arabic: "السميع", name: 'As-Sami', desc: "Maxfiy va oshkora gap va sharpalarni, xatto dildan oʻtganini ham, eshituvchi."),
  //   NameModel(arabic: "البصير", name: "Al-Basir", desc: "Hamma maxfiy va oshkora narsalarni koʻruvchi."),
  //   NameModel(arabic: "الحكم", name: "Al-Hakam", desc: "Qatʼiy hukm etuvchi."),
  //   NameModel(arabic: "العدل", name: "Al-Adi", desc: "Oʻta adolatli."),
  //   NameModel(arabic: 'اللطيف', name: "Al-Latif", desc: "Bandalariga sezdirmay oʻz lutfu ehsonini yetkasizb beruvchi."),
  //   NameModel(arabic: "الخبير", name: "Al-Xobir", desc: "Hamma maxfiy va oshkora ishlardan xabardor"),
  //   NameModel(arabic: "الحليم", name: "Al-Halim", desc: "Jazolashga shoshmaydigan, hilm bilan yaxshilik qilib turuvchi."),
  //   NameModel(arabic: "العظيم", name: "Al-Azim", desc: "Azamatli va ulugʻ zot. Aql tasavvur qila olmaydigan darajada azamatli va ulugʻ."),
  //   NameModel(arabic: "الغفور", name: "Al-G'ofur", desc: "Koʻp magʻfirat qiluvchi."),
  //   NameModel(arabic: "الشكور", name: "Ash-Shakur", desc: "Oʻz amaliga koʻp savob beruvchi."),
  //   NameModel(arabic: "العلي", name: "Al-Aliyy", desc: "Martabasi oliylikda benihoya."),
  //   NameModel(arabic: "الكبير", name: "Al-Kabir", desc: "Hammadan ulugʻ."),
  //   NameModel(arabic: "الحفيظ", name: "Al-Hafiz", desc: "Har bir narsani komil muhofaza qiluvchi."),
  //   NameModel(arabic: "المقيت", name: "Al-Muqit", desc: "Barcha moddiy va ruhiy rizqlarni yaratuvchi."),
  //   NameModel(arabic: "الحسيب", name: "An-Hasib", desc: "Hisob qiluvchi, kifoya qiluvchi."),
  //   NameModel(arabic: "الجليل", name: "Al-Jalil", desc: "Sifatlarida ulugʻlikka ega.")
  // ];
}