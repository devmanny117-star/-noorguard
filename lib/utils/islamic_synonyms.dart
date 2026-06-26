// Synonym/related-word groups for Islamic terms across all 15 supported
// languages (en, ar, ur, es, fr, id, zh, ja, bn, tr, sw, de, nl, pt, it).
// Each group is a flat list of lowercase strings: transliterations, Arabic
// script, and native translations for the same concept.
const List<List<String>> _kSynonymGroups = [
  // ── Prayer / Salah ─────────────────────────────────────────────────────────
  [
    'prayer', 'pray', 'praying', 'prayers', // en
    'salah', 'salat', 'salaah', 'salaat', // transliteration
    'namaz', 'namaaz', // ur/tr/bn/fa
    'صلاة', // ar
    'oración', 'rezar', // es
    'prière', 'prier', // fr
    'shalat', 'solat', // id
    '礼拜', '祈祷', '礼拝', // zh/ja
    'সালাত', 'নামাজ', // bn
    'swala', 'sala', // sw
    'gebet', // de
    'gebed', // nl
    'oração', 'reza', // pt
    'preghiera', // it
  ],
  // ── Fasting / Sawm ─────────────────────────────────────────────────────────
  [
    'fasting', 'fast', 'fasts', // en
    'sawm', 'saum', 'siyam', 'syam', // transliteration
    'ramadan', 'ramazan', 'ramadhan', // the month of fasting
    'صوم', 'صيام', 'رمضان', // ar
    'روزہ', // ur
    'ayuno', // es
    'jeûne', 'jeune', // fr
    'puasa', // id
    '斋戒', '断食', '斎戒', // zh/ja
    'রোজা', 'সওম', 'রমজান', // bn
    'oruç', 'ramazan', // tr
    'funga', 'saumu', // sw
    'fasten', // de
    'vasten', // nl
    'jejum', // pt
    'digiuno', // it
  ],
  // ── Pilgrimage / Hajj ──────────────────────────────────────────────────────
  [
    'pilgrimage', // en
    'hajj', 'haj', 'hejj', // transliteration
    'umrah', 'umra', 'omra', // lesser pilgrimage
    'حج', 'عمرة', // ar
    'peregrinación', 'peregrinaje', // es
    'pèlerinage', // fr
    'haji', // id
    '朝觐', '麦加朝圣', '巡礼', // zh/ja
    'হজ', 'ওমরাহ', // bn
    'hac', // tr
    'hija', // sw
    'pilgerfahrt', // de
    'bedevaart', // nl
    'peregrinação', // pt
    'pellegrinaggio', // it
  ],
  // ── Charity / Zakat / Sadaqah ──────────────────────────────────────────────
  [
    'charity', 'alms', 'donation', 'tithe', // en
    'zakat', 'zakah', 'zakaat', // obligatory alms
    'sadaqah', 'sadaqa', 'sadaqat', // voluntary charity
    'زكاة', 'صدقة', // ar
    'caridad', 'limosna', // es
    'charité', 'aumône', // fr
    'sedekah', 'infaq', 'zakat', // id
    '天课', '慈善', '捐款', // zh
    'দান', 'যাকাত', 'সদাকা', // bn
    'zekat', 'sadaka', // tr
    'zaka', 'sadaka', // sw
    'almosen', // de
    'aalmoezen', // nl
    'esmola', 'esmolar', // pt
    'elemosina', // it
  ],
  // ── God / Allah ────────────────────────────────────────────────────────────
  [
    'allah', 'god', 'lord', 'creator', 'divine', // en
    'rabb', 'rab', // the lord
    'الله', 'رب', 'الإله', // ar
    'dios', 'señor', // es
    'dieu', 'seigneur', // fr
    'tuhan', 'ilahi', // id
    '真主', '安拉', // zh
    '神', 'アッラー', // ja
    'আল্লাহ', 'খোদা', 'রব', // bn
    'tanrı', // tr
    'mungu', 'mola', // sw
    'gott', // de
    // nl: 'god' same
    'deus', // pt
    'dio', // it
  ],
  // ── Prophet / Messenger ────────────────────────────────────────────────────
  [
    'prophet', 'messenger', 'apostle', // en
    'nabi', 'rasul', 'rasool', // transliterations
    'muhammad', 'mohammed', 'mohammad', // the prophet's name
    'نبي', 'رسول', 'محمد', // ar
    'profeta', 'mensajero', // es
    'prophète', 'messager', // fr
    // id: nabi, rasul same
    '先知', '使者', // zh
    '預言者', '使徒', // ja
    'নবী', 'রাসুল', 'মুহাম্মদ', // bn
    'peygamber', // tr
    'mtume', 'nabii', // sw
    'gesandter', // de
    'profeet', 'boodschapper', // nl
    'mensageiro', // pt
    'messaggero', // it
  ],
  // ── Quran / Holy Book ──────────────────────────────────────────────────────
  [
    'quran', 'koran', 'holy book', 'scripture', // en
    'القرآن', 'الكتاب', // ar
    'corán', 'libro sagrado', // es
    'coran', 'livre saint', // fr
    'kitab suci', // id
    '可兰经', '古兰经', '圣书', // zh
    'コーラン', '聖典', // ja
    'কোরআন', 'পবিত্র গ্রন্থ', // bn
    'kuran', // tr
    'msahafu', // sw
    'koran', 'heilige schrift', // de/nl
    'alcorão', 'livro sagrado', // pt
    'corano', 'sacra scrittura', // it
  ],
  // ── Faith / Iman ───────────────────────────────────────────────────────────
  [
    'faith', 'belief', 'believe', 'trust', // en
    'iman', 'imaan', // transliteration
    'aqeedah', 'aqida', 'creed', // creed
    'إيمان', 'عقيدة', // ar
    'fe', 'creencia', 'creer', // es
    'foi', 'croyance', 'croire', // fr
    'kepercayaan', // id
    '信仰', '信念', // zh/ja
    'বিশ্বাস', 'ইমান', // bn
    'inanç', // tr
    'imani', 'amini', // sw
    'glaube', 'glauben', // de
    'geloof', 'geloven', // nl
    'fé', 'crença', // pt
    'fede', 'credenza', // it
  ],
  // ── Mosque / Masjid ────────────────────────────────────────────────────────
  [
    'mosque', 'masjid', 'musalla', // en/transliteration
    'مسجد', 'مصلى', // ar
    'mezquita', // es
    'mosquée', // fr
    // id: masjid same
    '清真寺', // zh
    'モスク', // ja
    'মসজিদ', // bn
    'cami', // tr
    'msikiti', // sw
    'moschee', // de
    'moskee', // nl
    'mesquita', // pt
    'moschea', // it
  ],
  // ── Call to Prayer / Adhan ─────────────────────────────────────────────────
  [
    'adhan', 'azan', 'athan', 'azaan', 'call to prayer', 'call of prayer', // en
    'أذان', // ar
    'llamada a la oración', // es
    'appel à la prière', // fr
    // id: azan same
    '宣礼', '礼拜号召', // zh
    'アザーン', // ja
    'আযান', // bn
    'ezan', // tr
    'adhana', // sw
    'gebetsruf', // de
    'gebedsoproep', // nl
    'chamada para a oração', // pt
    'chiamata alla preghiera', // it
  ],
  // ── Ablution / Wudu ────────────────────────────────────────────────────────
  [
    'wudu', 'wuzu', 'wudhu', 'wudhoo', // transliterations
    'ablution', 'purification', 'ritual wash', // en
    'وضوء', 'طهارة', // ar
    'ablución', 'purificación', // es
    // fr: ablution same
    'bersuci', // id
    '净礼', '洁净', // zh
    'ウドゥー', '清め', // ja
    'অযু', 'পবিত্রতা', // bn
    'abdest', // tr
    'twahara', 'udhu', // sw
    'waschung', 'reinigung', // de
    'wassing', 'reiniging', // nl
    'ablução', 'purificação', // pt
    'abluzione', 'purificazione', // it
  ],
  // ── Declaration of Faith / Shahada ─────────────────────────────────────────
  [
    'shahada', 'shahadah', 'shahadat', // transliterations
    'declaration of faith', 'testimony of faith', // en
    'الشهادة', // ar
    'declaración de fe', 'testimonio de fe', // es
    'déclaration de foi', 'témoignage', // fr
    'syahadat', 'kalimat syahadat', // id
    '清真言', '作证词', // zh
    'シャハーダ', '信仰告白', // ja
    'শাহাদাহ', 'কালিমা', // bn
    'kelime-i şehadet', 'şehadet', // tr
    // sw: shahada same
    'glaubensbekenntnis', // de
    'geloofsverklaring', // nl
    'declaração de fé', // pt
    'dichiarazione di fede', // it
  ],
  // ── Remembrance of God / Dhikr ─────────────────────────────────────────────
  [
    'dhikr', 'zikr', 'dhikir', 'zikir', // transliterations
    'remembrance', 'remembrance of god', 'glorification', // en
    'الذكر', // ar
    'remembranza', 'glorificación', // es
    'rappel', // fr
    'dzikir', // id
    '赞念', '念主', // zh
    'ズィクル', '神の想起', // ja
    'জিকির', // bn
    // tr: zikir same
    'adhkari', // sw
    'gottesgedenken', // de
    'gedenken', // nl
    'louvor', // pt
    'ricordo di dio', // it
  ],
  // ── Supplication / Dua ─────────────────────────────────────────────────────
  [
    'dua', 'duaa', "du'a", 'duaa', // transliterations
    'supplication', 'invocation', // en
    'الدعاء', // ar
    'súplica', 'invocación', 'rogativa', // es
    // fr: supplication same
    'doa', // id
    '祈祷词', '祈求', // zh
    'ドゥアー', '祈り', // ja
    'দোয়া', // bn
    'niyaz', // tr
    'ombi', // sw
    'bittgebet', 'fürbitte', // de
    'smeekgebed', // nl
    'invocação', // pt
    'supplica', 'invocazione', // it
  ],
  // ── Paradise / Jannah ──────────────────────────────────────────────────────
  [
    'paradise', 'heaven', 'jannah', 'jannat', // en/transliteration
    'الجنة', // ar
    'paraíso', 'cielo', // es
    'paradis', 'ciel', // fr
    'surga', 'syurga', // id
    '天堂', '乐园', // zh
    '天国', 'ジャンナ', // ja
    'জান্নাত', 'বেহেশত', // bn
    'cennet', // tr
    'peponi', // sw
    'paradies', 'himmel', // de
    'paradijs', 'hemel', // nl
    'paraíso', 'céu', // pt
    'paradiso', 'cielo', // it
  ],
  // ── Hellfire / Jahannam ────────────────────────────────────────────────────
  [
    'hell', 'hellfire', 'jahannam', 'naar', 'fire', // en/transliteration
    'الجحيم', 'جهنم', 'النار', // ar
    'infierno', 'fuego infernal', // es
    'enfer', // fr
    'neraka', // id
    '地狱', '火狱', // zh
    '地獄', 'ジャハンナム', // ja
    'জাহান্নাম', 'দোযখ', // bn
    'cehennem', // tr
    'jehanamu', // sw
    'hölle', // de
    'hel', 'helvuur', // nl
    'inferno', // pt/it
  ],
  // ── Patience / Sabr ────────────────────────────────────────────────────────
  [
    'patience', 'patient', 'perseverance', 'endurance', // en
    'sabr', 'saber', // transliteration
    'الصبر', // ar
    'paciencia', 'perseverancia', // es
    'persévérance', // fr
    'sabar', 'kesabaran', // id
    '忍耐', // zh/ja
    'ধৈর্য', 'সবর', // bn
    'sabır', // tr
    'subira', // sw
    'geduld', 'ausdauer', // de/nl
    'paciência', // pt
    'pazienza', // it
  ],
  // ── Mercy / Rahma ──────────────────────────────────────────────────────────
  [
    'mercy', 'compassion', 'kindness', // en
    'rahma', 'rahman', 'rahim', 'raheem', 'ar-rahman', 'ar-rahim', // transliterations
    'الرحمة', 'الرحمن', 'الرحيم', // ar
    'misericordia', 'compasión', // es
    'miséricorde', // fr
    'rahmat', 'kasih sayang', // id
    '仁慈', '慈悲', // zh/ja
    'রহমত', 'দয়া', // bn
    'rahmet', 'merhamet', // tr
    'huruma', 'rehema', // sw
    'barmherzigkeit', 'gnade', // de
    'barmhartigheid', 'genade', // nl
    'misericórdia', 'compaixão', // pt
    'misericordia', 'compassione', // it
  ],
  // ── Repentance / Tawbah ────────────────────────────────────────────────────
  [
    'repentance', 'forgiveness', 'repent', // en
    'tawbah', 'tawba', 'istighfar', // transliterations
    'التوبة', 'الاستغفار', // ar
    'arrepentimiento', 'perdón', // es
    'repentir', 'pardon', // fr
    'taubat', 'tawbat', // id
    '悔罪', '宽恕', '悔悛', // zh/ja
    'তওবা', 'ক্ষমা', // bn
    'tövbe', 'istiğfar', // tr
    'toba', 'msamaha', // sw
    'reue', 'vergebung', 'buße', // de
    'berouw', 'vergeving', // nl
    'arrependimento', 'perdão', // pt
    'pentimento', 'perdono', // it
  ],
  // ── Blessing / Barakah ─────────────────────────────────────────────────────
  [
    'blessing', 'blessed', 'blessings', // en
    'barakah', 'baraka', 'barakaat', // transliterations
    'البركة', // ar
    'bendición', 'bendiciones', // es
    'bénédiction', 'grâce', // fr
    'berkah', 'barokah', // id
    '祝福', '恩赐', // zh/ja
    'বরকত', 'আশীর্বাদ', // bn
    'bereket', // tr
    // sw: baraka same
    'segen', // de
    'zegen', // nl
    'bênção', // pt
    'benedizione', // it
  ],
  // ── Day of Judgment / Qiyamah ──────────────────────────────────────────────
  [
    'day of judgment', 'judgment day', 'day of judgement', 'hereafter', 'afterlife', // en
    'qiyamah', 'qiyama', 'yawm', 'akhirah', 'akhira', // transliterations
    'القيامة', 'الآخرة', 'يوم الدين', // ar
    'día del juicio', 'juicio final', 'más allá', // es
    'jour du jugement', 'jugement dernier', 'au-delà', // fr
    'hari kiamat', 'kiamat', 'akhirat', // id
    '末日', '复活日', '来世', // zh
    '審判の日', '来世', 'ジャハンナム', // ja
    'কিয়ামত', 'আখিরাত', // bn
    'kıyamet', 'ahiret', // tr
    'siku ya hukumu', 'kiyama', // sw
    'jüngster tag', 'auferstehung', 'jenseits', // de
    'dag des oordeels', 'hiernamaals', // nl
    'dia do juízo', 'além', // pt
    'giorno del giudizio', 'aldilà', // it
  ],
  // ── Prophetic Tradition / Sunnah & Hadith ──────────────────────────────────
  [
    'sunnah', 'sunna', 'hadith', 'hadis', 'tradition', 'narration', // en
    'السنة', 'الحديث', // ar
    'tradición profética', // es
    'hadiths', // fr
    'hadits', // id
    '圣训', '逊奈', // zh
    'スンナ', 'ハディース', // ja
    'সুন্নাহ', 'হাদিস', // bn
    'sünnet', // tr
    'hadithi', // sw
    // de/nl/pt/it: hadith/sunnah same
  ],
  // ── Angels / Malaika ───────────────────────────────────────────────────────
  [
    'angel', 'angels', // en
    'malak', 'malaika', 'malaek', // transliterations
    'ملك', 'ملائكة', // ar
    'ángel', 'ángeles', // es
    'ange', 'anges', // fr
    'malaikat', // id
    '天使', // zh/ja
    'ফেরেশতা', 'মালাক', // bn
    'melek', 'melekler', // tr
    // sw: malaika same
    'engel', // de/nl
    'anjo', 'anjos', // pt
    'angelo', 'angeli', // it
  ],
  // ── Trust in God / Tawakkul ────────────────────────────────────────────────
  [
    'tawakkul', 'tawakul', 'tawakkal', // transliterations
    'trust in god', 'reliance on god', 'reliance', // en
    'التوكل', // ar
    'confianza en dios', 'encomendarse', // es
    'confiance en dieu', // fr
    'tawakal', // id
    '托靠', '依靠真主', // zh
    'タワックル', '神への信頼', // ja
    'তাওয়াক্কুল', // bn
    'tevekkül', // tr
    'kumtegemea mungu', // sw
    'gottvertrauen', // de
    'vertrouwen op god', // nl
    'confiança em deus', // pt
    'fiducia in dio', // it
  ],
  // ── Gratitude / Shukr ──────────────────────────────────────────────────────
  [
    'gratitude', 'thanks', 'thankfulness', 'grateful', // en
    'shukr', 'shukran', // transliterations
    'الشكر', // ar
    'gratitud', 'agradecimiento', // es
    'reconnaissance', // fr
    'syukur', 'rasa syukur', // id
    '感谢', '感恩', // zh/ja
    'কৃতজ্ঞতা', 'শুকরিয়া', // bn
    'şükür', 'şükran', // tr
    'shukrani', // sw
    'dankbarkeit', // de
    'dankbaarheid', // nl
    'gratidão', 'agradecimento', // pt
    'gratitudine', // it
  ],
  // ── Islamic Jurisprudence / Fiqh & Sharia ──────────────────────────────────
  [
    'fiqh', 'jurisprudence', 'islamic law', // en
    'sharia', 'shariah', 'shariat', // islamic law
    'الفقه', 'الشريعة', // ar
    'jurisprudencia islámica', // es
    'jurisprudence islamique', 'charia', // fr
    'fiqih', 'hukum islam', 'syariah', // id
    '伊斯兰教法', '菲格赫', // zh
    'フィクフ', 'シャリーア', // ja
    'ফিকহ', 'শরিয়া', // bn
    'fıkıh', 'şeriat', // tr
    'fikihi', 'sheria', // sw
    'islamisches recht', 'scharia', // de
    'islamitisch recht', // nl
    'direito islâmico', // pt
    'diritto islamico', // it
  ],
  // ── Night Prayer / Tahajjud ────────────────────────────────────────────────
  [
    'tahajjud', 'tahajud', 'qiyam', 'night prayer', 'night worship', // en
    'التهجد', 'قيام الليل', // ar
    'oración nocturna', // es
    'prière nocturne', // fr
    'shalat malam', // id
    '夜礼拜', // zh
    '夜の礼拝', // ja
    'তাহাজ্জুদ', // bn
    'teheccüd', 'gece namazı', // tr
    'sala ya usiku', // sw
    'nachtgebet', // de
    'nachtgebed', // nl
    'oração noturna', // pt
    'preghiera notturna', // it
  ],
  // ── Friday Prayer / Jummah ─────────────────────────────────────────────────
  [
    'jummah', 'juma', "jum'ah", 'friday prayer', // en/transliteration
    'الجمعة', // ar
    'viernes', 'oración del viernes', // es
    'vendredi', 'prière du vendredi', // fr
    'jumat', "jum'at", // id
    '主麻', '周五礼拜', // zh
    '金曜礼拝', 'ジュムア', // ja
    'জুমআ', 'জুমার নামাজ', // bn
    'cuma', 'cuma namazı', // tr
    'ijumaa', // sw
    'freitagsgebet', // de
    'vrijdaggebed', // nl
    'oração da sexta-feira', // pt
    'preghiera del venerdì', // it
  ],
  // ── Companions / Sahaba ────────────────────────────────────────────────────
  [
    'sahaba', 'companions', 'sahabah', // en/transliteration
    'الصحابة', // ar
    'compañeros', 'compañeros del profeta', // es
    'compagnons', 'compagnons du prophète', // fr
    'sahabat', 'sahabat nabi', // id
    '圣门弟子', // zh
    '弟子たち', 'サハーバ', // ja
    'সাহাবি', // bn
    'sahabe', // tr
    'masahaba', // sw
    'prophetengefährten', 'gefährten', // de
    'metgezellen', // nl
    'companheiros', 'companheiros do profeta', // pt
    'compagni', 'compagni del profeta', // it
  ],
  // ── Marriage / Family / Divorce ───────────────────────────────────────────
  [
    // English
    'wife', 'wives', 'husband', 'husbands', 'marriage', 'married', 'marry',
    'nikah', 'spouse', 'spouses', 'wedlock', 'wed', 'wedding',
    'divorce', 'talaq', 'mahr', 'dowry', 'dower',
    // Arabic
    'زوج', 'زوجة', 'زواج', 'طلاق', 'مهر', 'نكاح',
    // Urdu
    'شادی', 'بیوی', 'شوہر', 'مہر',
    // Spanish
    'matrimonio', 'esposo', 'esposa', 'divorcio', 'casamiento',
    // French
    'mariage', 'époux', 'épouse', 'divorce',
    // Indonesian
    'pernikahan', 'istri', 'suami', 'cerai', 'menikah',
    // Chinese
    '婚姻', '妻子', '丈夫', '离婚',
    // Japanese
    '結婚', '妻', '夫', '離婚',
    // Bengali
    'বিবাহ', 'স্ত্রী', 'স্বামী', 'তালাক',
    // Turkish
    'evlilik', 'eş', 'boşanma', 'mehir',
    // Swahili
    'ndoa', 'mke', 'mume', 'talaka',
    // German
    'ehe', 'heirat', 'ehemann', 'ehefrau', 'scheidung',
    // Dutch
    'huwelijk', 'echtgenoot', 'echtgenote', 'echtscheiding',
    // Portuguese
    'casamento', 'esposa', 'divórcio',
    // Italian
    'matrimonio', 'marito', 'moglie', 'divorzio',
  ],
  // ── Prophets (bilateral name mapping) ─────────────────────────────────────
  ['jesus', 'isa', 'عيسى'],
  ['moses', 'musa', 'موسى'],
  ['abraham', 'ibrahim', 'إبراهيم'],
  ['noah', 'nuh', 'نوح'],
  ['joseph', 'yusuf', 'يوسف'],
  ['mary', 'maryam', 'مريم'],
  ['david', 'dawud', 'داود'],
  ['solomon', 'sulaiman', 'سليمان', 'süleyman'],
  ['jonah', 'yunus', 'يونس'],
  ['job', 'ayyub', 'أيوب'],
  ['aaron', 'harun', 'هارون'],
  ['ishmael', 'ismail', 'إسماعيل'],
  ['isaac', 'ishaq', 'إسحاق'],
  ['lot', 'lut', 'لوط'],
  ['john', 'yahya', 'يحيى', 'john the baptist'],
  ['idris', 'enoch', 'إدريس'],
];

/// Expands [query] to include all synonymous/related Islamic terms.
///
/// - Exact matches trigger expansion regardless of length.
/// - Partial matches (`term.contains(query)`) require at least 3 characters
///   to avoid false positives from very short substrings.
class IslamicSynonyms {
  const IslamicSynonyms._();

  static List<String> expandQuery(String query) {
    if (query.isEmpty) return [query];
    final lq = query.toLowerCase();
    final Set<String> expanded = {lq};
    for (final group in _kSynonymGroups) {
      final lowerGroup = group.map((t) => t.toLowerCase()).toList();
      final bool matches = lowerGroup.contains(lq) ||
          (lq.length >= 3 &&
              lowerGroup.any(
                  (t) => t.contains(lq) || (t.length >= 3 && lq.contains(t))));
      if (matches) {
        expanded.addAll(lowerGroup);
      }
    }
    return expanded.toList();
  }

  /// Strips Arabic definite-article prefixes (al-, an-, at-, ash-, etc.)
  /// followed by a hyphen or space so "Baqarah" and "Al-Baqarah" resolve
  /// to the same bare root for name matching.
  static String stripArticle(String s) {
    final stripped = s.replaceFirst(
      RegExp(
        r'^(al|an|at|as|ash|az|ar|ad|adh|ath)[\s\-]+',
        caseSensitive: false,
      ),
      '',
    );
    return stripped.isEmpty ? s : stripped;
  }
}
