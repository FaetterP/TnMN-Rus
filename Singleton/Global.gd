extends Node

# Credits by now:

# Music from #Uppbeat (free for Creators!):
# https://uppbeat.io/t/albert-behar/dixieland-strut
# License code: 2LNDEW2CZF12MRAY

# szegvari
# Experimental Abstract Ethno Latin style Guitar Slow Cinematic World Modern Music - Mastered
# 89Bpm

# Developed by Ignacio Alvarado 
# Create on April 2023
# Last update on May 21 2024

const ROMAN_STINLSKY_DATA = {"NAME": "Роман", "LAST_NAME": "Стилнски", "ID_NUMBER": "483924059684", "ID_EXPIRATION": "05/1968", "APARTMENT_NUMBER_ENGLISH": "F01-01", "APARTMENT_NUMBER_SPANISH": "P01-01", "PHONE_NUMBER": "1152", "OCCUPATION_ENGLISH": "Бухгалтер", "OCCUPATION_SPANISH": "Contador", "OCCUPATION_CHINESE": "会计师","APPEARANCE_CHINESE": "外貌:-* 大鼻子-* 下巴右侧的疤痕-* 瘦长的脸-* 一只眉毛-* 戴帽子","APPEARANCE_ENGLISH": "Внешность:-* Большой нос-* Шрам справа-* Длинное лицо-* Одна бровь-* Носит шляпу", "APPEARANCE_SPANISH": "Apariencia:-* Nariz grande-* Cicatriz en mentón der.-* Cara alargada-* Una ceja-* Usa sombrero"}
const LOIS_STINLSKY_DATA = {"NAME": "Лоис", "LAST_NAME": "Стилнски", "ID_NUMBER": "894569723651", "ID_EXPIRATION": "10/1969", "APARTMENT_NUMBER_ENGLISH": "F01-01", "APARTMENT_NUMBER_SPANISH": "P01-01", "PHONE_NUMBER": "1152", "OCCUPATION_ENGLISH": "Домохозяйка", "OCCUPATION_SPANISH": "Ella es ama de casa", "OCCUPATION_CHINESE": "她是家庭主妇","APPEARANCE_CHINESE": "外貌:-* 大嘴唇-* 左脸颊上的痣-* 圆脸-* 短发","APPEARANCE_ENGLISH": "Внешность:-* Большие губы-* Родинка на левой щеке-* Круглое лицо-* Короткие волосы", "APPEARANCE_SPANISH": "Apariencia:-* Labios grandes-* Lunar en mejilla izq.-* Cara redonda-* Cabello corto"}
const MARGARETTE_BUBBLES_DATA = {"NAME": "Маргарет", "LAST_NAME": "Бабблс", "ID_NUMBER": "103268014590", "ID_EXPIRATION": "12/1975", "APARTMENT_NUMBER_ENGLISH": "F02-03", "APARTMENT_NUMBER_SPANISH": "P02-03", "PHONE_NUMBER": "6431", "OCCUPATION_ENGLISH": "Швея", "OCCUPATION_SPANISH": "Costurera", "OCCUPATION_CHINESE": "裁缝师 ","APPEARANCE_CHINESE": "外貌:-* 卷发-* 左眼斜视-* 圆鼻子-* 微笑大","APPEARANCE_ENGLISH": "Внешность:-* Вьющиеся волосы-* Кривой левый глаз-* Круглый нос-* Большая улыбка", "APPEARANCE_SPANISH": "Apariencia:-* Cabello rizado-* Ojo izq. desviado-* Nariz redonda-* Sonrisa grande"}
const ALF_CAPPUCCIN_DATA = {"NAME": "Альф", "LAST_NAME": "Каппуццин", "ID_NUMBER": "120548096347","ID_EXPIRATION": "08/1960","APARTMENT_NUMBER_ENGLISH": "F03-04", "APARTMENT_NUMBER_SPANISH": "P03-04", "PHONE_NUMBER": "4258", "OCCUPATION_ENGLISH": "Юрист","OCCUPATION_SPANISH": "Abogado", "OCCUPATION_CHINESE": "律师","APPEARANCE_CHINESE": "外貌:-* 大鼻子-* 突出的小胡子-* 戴单片眼镜-* 戴帽子-* 圆脸","APPEARANCE_ENGLISH": "Внешность:-* Большой нос-* Выдающиеся усы-* Использует монокль-* Носит шляпу-* Круглое лицо", "APPEARANCE_SPANISH": "Apariencia:-* Nariz grande-* Bigote prominente-* Usa un monóculo-* Usa sombrero-* Cara redonda"}
const ELENOIS_SVERCHZT_DATA = {"NAME": "Эленоис", "LAST_NAME": "Сверчт", "ID_NUMBER": "845323014956", "ID_EXPIRATION": "03/1980", "APARTMENT_NUMBER_ENGLISH": "F01-04", "APARTMENT_NUMBER_SPANISH": "P01-04", "PHONE_NUMBER": "6996", "OCCUPATION_ENGLISH": "Модель", "OCCUPATION_SPANISH": "Modelo", "OCCUPATION_CHINESE": "模特","APPEARANCE_CHINESE": "外貌:-* 左脸颊上有痣-* 小而尖的鼻子-* 瘦-* 长脖子-* 有一个双胞胎","APPEARANCE_ENGLISH": "Внешность:-* Родинка на левой щеке-* Маленький острый нос-* Стройная-* Длинная шея-* Есть близнец", "APPEARANCE_SPANISH": "Apariencia:-* Lunar en mejilla izq.-* Nariz pequeña y puntiaguda-* Delgada-* Cuello largo-* Tiene una gemela"}
const SELENNE_SVERCHZT_DATA = {"NAME": "Селенна", "LAST_NAME": "Сверчт", "ID_NUMBER": "785613269514", "ID_EXPIRATION": "03/1980", "APARTMENT_NUMBER_ENGLISH": "F01-04", "APARTMENT_NUMBER_SPANISH": "P01-04", "PHONE_NUMBER": "6996", "OCCUPATION_ENGLISH": "Модель", "OCCUPATION_SPANISH": "Modelo", "OCCUPATION_CHINESE": "模特","APPEARANCE_CHINESE": "外貌:-* 右脸颊上有痣-* 小而尖的鼻子-* 瘦-* 长脖子-* 有一个双胞胎","APPEARANCE_ENGLISH": "Внешность:-* Родинка на правой щеке-* Маленький острый нос-* Стройная-* Длинная шея-* Есть близнец", "APPEARANCE_SPANISH": "Apariencia:-* Lunar en mejilla der.-* Nariz pequeña y puntiaguda-* Delgada-* Cuello largo-* Tiene una gemela"}
const IZAACK_GAUSS_DATA = {"NAME": "Изаак", "LAST_NAME": "Гаусс", "ID_NUMBER": "456985512369", "ID_EXPIRATION": "09/1965", "APARTMENT_NUMBER_ENGLISH": "F02-02", "APARTMENT_NUMBER_SPANISH": "P02-02", "PHONE_NUMBER": "7332", "OCCUPATION_ENGLISH": "Репортёр", "OCCUPATION_SPANISH": "Reportero", "OCCUPATION_CHINESE": "记者","APPEARANCE_CHINESE": "外貌:-* 大眉毛-* 微笑大-* 突出的下巴-* 大鼻子","APPEARANCE_ENGLISH": "Внешность:-* Большие брови-* Большая улыбка-* Выдающийся подбородок-* Большой нос", "APPEARANCE_SPANISH": "Apariencia:-* Cejas grandes-* Sonrisa grande-* Barbilla prominente-* Nariz grande"}
const RAFTTELLYN_CAPPUCCIN_DATA = {"NAME": "Рафтеллин", "LAST_NAME": "Каппуццин", "ID_NUMBER": "568554596329","ID_EXPIRATION": "06/1962","APARTMENT_NUMBER_ENGLISH": "F03-04", "APARTMENT_NUMBER_SPANISH": "P03-04", "PHONE_NUMBER": "4258", "OCCUPATION_ENGLISH": "Домохозяйка","OCCUPATION_SPANISH": "Ella es ama de casa", "OCCUPATION_CHINESE": "她是家庭主妇","APPEARANCE_CHINESE": "外貌:-* 细长的脸-* 大鼻子-* 直发-* 戴头带","APPEARANCE_ENGLISH": "Внешность:-* Длинное лицо-* Большой нос-* Прямые волосы-* Носит повязку", "APPEARANCE_SPANISH": "Apariencia:-* Cara alargada-* Nariz grande-* Cabello lacio-* Usa una vincha"}
const ARNOLD_SCHMICHT_DATA = {"NAME": "Арнольд", "LAST_NAME": "Шмихт", "ID_NUMBER": "778566219322", "ID_EXPIRATION": "10/1971", "APARTMENT_NUMBER_ENGLISH": "F02-01", "APARTMENT_NUMBER_SPANISH": "P02-01", "PHONE_NUMBER": "5123", "OCCUPATION_ENGLISH": "Писатель", "OCCUPATION_SPANISH": "Escritor", "OCCUPATION_CHINESE": "作家","APPEARANCE_CHINESE": "外貌:-* 大眉毛-* 突出的胡子-* 戴帽子-* 圆脸-* 短发","APPEARANCE_ENGLISH": "Внешность:-* Большие брови-* Выдающиеся усы-* Носит шляпу-* Круглое лицо-* Короткие волосы", "APPEARANCE_SPANISH": "Apariencia:-* Cejas grandes-* Bigote prominente-* Usa sombrero-* Cara redonda-* Cabello corto"}
const GLORIA_SCHMICHT_DATA = {"NAME": "Глория", "LAST_NAME": "Шмихт", "ID_NUMBER": "698522341150", "ID_EXPIRATION": "04/1974", "APARTMENT_NUMBER_ENGLISH": "F02-01", "APARTMENT_NUMBER_SPANISH": "P02-01", "PHONE_NUMBER": "5123", "OCCUPATION_ENGLISH": "Банкир", "OCCUPATION_SPANISH": "Banquera", "OCCUPATION_CHINESE": "女银行家","APPEARANCE_CHINESE": "外貌:-* 圆脸-* 右脸颊上有痣-* 短发-* 圆鼻子","APPEARANCE_ENGLISH": "Внешность:-* Круглое лицо-* Родинка на правой щеке-* Короткие волосы-* Круглый нос", "APPEARANCE_SPANISH": "Apariencia:-* Cara redonda-* Lunar en mejilla der.-* Cabello corto-* Nariz redonda"}
const ROBERTOSKY_PEACHMAN_DATA = {"NAME": "Робертски", "LAST_NAME": "Персиков", "ID_NUMBER": "114652289730", "ID_EXPIRATION": "12/1973", "APARTMENT_NUMBER_ENGLISH": "F01-02", "APARTMENT_NUMBER_SPANISH": "P01-02", "PHONE_NUMBER": "2668", "OCCUPATION_ENGLISH": "Сапожник", "OCCUPATION_SPANISH": "Zapatero", "OCCUPATION_CHINESE": "鞋匠","APPEARANCE_CHINESE": "外貌:-* 长脖子-* 无眉毛-* 大鼻子-* 有山羊胡","APPEARANCE_ENGLISH": "Внешность:-* Длинная шея-* Без бровей-* Большой нос-* Есть бородка", "APPEARANCE_SPANISH": "Apariencia:-* Cuello largo-* Sin cejas-* Nariz grande-* Tiene barba de chivo"}
const ALBERTOSKY_PEACHMAN_DATA = {"NAME": "Альбертски", "LAST_NAME": "Персиков", "ID_NUMBER": "146512986354", "ID_EXPIRATION": "10/1974", "APARTMENT_NUMBER_ENGLISH": "F01-02", "APARTMENT_NUMBER_SPANISH": "P01-02", "PHONE_NUMBER": "2668", "OCCUPATION_ENGLISH": "Сапожник", "OCCUPATION_SPANISH": "Zapatero", "OCCUPATION_CHINESE": "鞋匠","APPEARANCE_CHINESE": "外貌:-* 留着小胡子-* 下巴突出-* 大鼻子-* 眉毛浓密-* 长脸","APPEARANCE_ENGLISH": "Внешность:-* Есть усы-* Выдающийся подбородок-* Большой нос-* большие брови-* Длинное лицо", "APPEARANCE_SPANISH": "Apariencia:-* Tiene bigote-* Barbilla prominente-* Nariz grande-* Cejas grandes-* Cara alargada"}
const MIA_STONE_DATA = {"NAME": "Миа", "LAST_NAME": "Стоун", "ID_NUMBER": "789564525115", "ID_EXPIRATION": "08/1978", "APARTMENT_NUMBER_ENGLISH": "F03-01", "APARTMENT_NUMBER_SPANISH": "P03-01", "PHONE_NUMBER": "1425", "OCCUPATION_ENGLISH": "Учитель", "OCCUPATION_SPANISH": "Profesora", "OCCUPATION_CHINESE": "女老师","APPEARANCE_CHINESE": "外貌:-* 长发-* 圆而小的鼻子-* 有雀斑-* 椭圆脸-* 细眉","APPEARANCE_ENGLISH": "Внешность:-* Длинные волосы-* Маленький круглый нос-* Есть веснушки-* Овальное лицо-* Тонкие брови", "APPEARANCE_SPANISH": "Apariencia:-* Cabello largo-* Nariz redonda y pequeña-* Tiene pecas-* Cara ovalada-* Cejas delgadas"}
const DR_W_AFTON_DATA = {"NAME": "Д-р. В.", "LAST_NAME": "Афтон", "ID_NUMBER": "250489656214", "ID_EXPIRATION": "03/1971", "APARTMENT_NUMBER_ENGLISH": "F03-01", "APARTMENT_NUMBER_SPANISH": "P03-01", "PHONE_NUMBER": "1425", "OCCUPATION_ENGLISH": "Физик", "OCCUPATION_SPANISH": "Físico", "OCCUPATION_CHINESE": "物理学家","APPEARANCE_CHINESE": "外貌:-* 浓眉-* 戴眼镜-* 短发-* 圆鼻子-* 方形头","APPEARANCE_ENGLISH": "Внешность:-* Густые брови-* Носит очки-* Короткие волосы-* Круглый нос-* Квадратная голова", "APPEARANCE_SPANISH": "Apariencia:-* Cejas robustas-* Usa lentes-* Cabello corto-* Nariz redonda-* Cabeza cuadrada"}
const ANGUS_CIPRIANNI_DATA = {"NAME": "Ангус", "LAST_NAME": "Чиприанни", "ID_NUMBER": "565003698845", "ID_EXPIRATION": "05/1968", "APARTMENT_NUMBER_ENGLISH": "F01-03", "APARTMENT_NUMBER_SPANISH": "P01-03", "PHONE_NUMBER": "5513", "OCCUPATION_ENGLISH": "Бизнесмен", "OCCUPATION_SPANISH": "Empresario", "OCCUPATION_CHINESE": "企业家","APPEARANCE_CHINESE": "外貌:-* 长脖子-* 戴帽子-* 留胡子-* 小眼睛","APPEARANCE_ENGLISH": "Внешность:-* Длинная шея-* Носит шляпу-* Есть усы-* Маленькие глаза", "APPEARANCE_SPANISH": "Apariencia:-* Cuello largo-* Usa sombrero-* Tiene bigote-* Ojos pequeños"}
const FRANCIS_MOSSES_DATA = {"NAME": "Фрэнсис", "LAST_NAME": "Моссес", "ID_NUMBER": "235569418995", "ID_EXPIRATION": "09/1964", "APARTMENT_NUMBER_ENGLISH": "F03-02", "APARTMENT_NUMBER_SPANISH": "P03-02", "PHONE_NUMBER": "4122", "OCCUPATION_ENGLISH": "Молочник", "OCCUPATION_SPANISH": "Lechero", "OCCUPATION_CHINESE": "牛奶配送员","APPEARANCE_CHINESE": "外貌:-* 长鼻子-* 细下巴-* 疲倦的眼睛-* 短发-* 戴帽子","APPEARANCE_ENGLISH": "Внешность:-* Длинный нос-* Тонкий подбородок-* Уставшие глаза-* Короткие волосы-* Носит шляпу", "APPEARANCE_SPANISH": "Apariencia:-* Nariz larga-* Barbilla delgada-* Ojos cansados-* Cabello corto-* Usa sombrero"}
const ANASTACHA_MIKAELYS_DATA = {"NAME": "Анастача", "LAST_NAME": "Микаелис", "ID_NUMBER": "132698534462", "ID_EXPIRATION": "05/1985", "APARTMENT_NUMBER_ENGLISH": "F02-04", "APARTMENT_NUMBER_SPANISH": "P02-04", "PHONE_NUMBER": "1346", "OCCUPATION_ENGLISH": "Студент", "OCCUPATION_SPANISH": "Estudiante", "OCCUPATION_CHINESE": "学生","APPEARANCE_CHINESE": "外貌:-* 疲倦的眼睛-* 两个马尾辫-* 小鼻子-* 圆脸","APPEARANCE_ENGLISH": "Внешность:-* Уставшие глаза-* Два хвостика-* Маленький нос-* Круглое лицо", "APPEARANCE_SPANISH": "Apariencia:-* Ojos cansados-* Dos coletas-* Nariz pequeña-* Cara redonda"}
const NACHA_MIKAELYS_DATA = {"NAME": "Нача", "LAST_NAME": "Микаелис", "ID_NUMBER": "789653665413", "ID_EXPIRATION": "11/1973", "APARTMENT_NUMBER_ENGLISH": "F02-04", "APARTMENT_NUMBER_SPANISH": "P02-04", "PHONE_NUMBER": "1346", "OCCUPATION_ENGLISH": "Шеф", "OCCUPATION_SPANISH": "Cocinera", "OCCUPATION_CHINESE": "厨师","APPEARANCE_CHINESE": "外貌:-* 右眼蓝色-* 左眼绿色-* 卷发-* 有雀斑-* 圆脸","APPEARANCE_ENGLISH": "Внешность:-* Правый глаз голубой-* Левый глаз зеленый-* Кудрявые волосы-* У нее веснушки-* Круглое лицо", "APPEARANCE_SPANISH": "Apariencia:-* Ojo der. azul-* Ojo izq. verde-* Cabello rizado-* Tiene pecas-* Cara redonda"}
const STEVEN_RUDBOYS_DATA = {"NAME": "Стивен", "LAST_NAME": "Рудбойс", "ID_NUMBER": "565845455965", "ID_EXPIRATION": "02/1966", "APARTMENT_NUMBER_ENGLISH": "F03-03", "APARTMENT_NUMBER_SPANISH": "P03-03", "PHONE_NUMBER": "4242", "OCCUPATION_ENGLISH": "Пилот", "OCCUPATION_SPANISH": "Piloto", "OCCUPATION_CHINESE": "飞行员","APPEARANCE_CHINESE": "外貌:-* 大鼻子-* 戴眼镜-* 短发-* 小头","APPEARANCE_ENGLISH": "Внешность:-* Большой нос-* Носит очки-* Короткие волосы-* Маленькая голова", "APPEARANCE_SPANISH": "Apariencia:-* Nariz grande-* Usa lentes-* Cabello corto-* Cabeza pequeña"}
const MCLOOY_RUDBOYS_DATA = {"NAME": "Маклой", "LAST_NAME": "Рудбойс", "ID_NUMBER": "964516184611", "ID_EXPIRATION": "07/1958", "APARTMENT_NUMBER_ENGLISH": "F03-03", "APARTMENT_NUMBER_SPANISH": "P03-03", "PHONE_NUMBER": "4242", "OCCUPATION_ENGLISH": "В отставке", "OCCUPATION_SPANISH": "Retirado", "OCCUPATION_CHINESE": "退休了","APPEARANCE_CHINESE": "外貌:-* 戴胡子-* 大鼻子-* 有山羊胡-* 抽烟-* 总是戴帽子","APPEARANCE_ENGLISH": "Внешность:-* Есть усы-* Большой нос-* Есть бородка-* Курит-* ВСЕГДА носит шляпу", "APPEARANCE_SPANISH": "Apariencia:-* Tiene bigote-* Nariz grande-* Tiene barba de chivo-* Fuma-* SIEMPRE usa sombrero"}
const XEZBET_DATA = {"NAME": "Ксезбет", "LAST_NAME": "Ксербет", "ID_NUMBER": "332569945968", "ID_EXPIRATION": "10/1970", "APARTMENT_NUMBER_ENGLISH": "F01-01", "APARTMENT_NUMBER_SPANISH": "P01-01", "PHONE_NUMBER": "1152", "OCCUPATION_ENGLISH": "Пожиратель душ", "OCCUPATION_SPANISH": "Devorador de almas", "OCCUPATION_CHINESE": "灵魂吞噬者","APPEARANCE_CHINESE": "外貌:-* 头上的疤痕-* 小鼻子-* 微笑大-* 两个纹身-* 左颧骨有疤痕","APPEARANCE_ENGLISH": "Внешность:-* Шрам на голове-* Маленький нос-* Большая улыбка-* Две татуировки-* Шрам на левой скуле", "APPEARANCE_SPANISH": "Apariencia:-* Cicatriz en la cabeza-* Nariz pequeña-* Sonrisa grande-* Dos tatuajes-* Cicatriz en pómulo izq."}
const DRUGIA_DATA = {"NAME": "Другиа", "LAST_NAME": "Флеюретти", "ID_NUMBER": "116682111989","ID_EXPIRATION": "04/1968", "APARTMENT_NUMBER_ENGLISH": "F01-01", "APARTMENT_NUMBER_SPANISH": "P01-01", "PHONE_NUMBER": "1152", "OCCUPATION_ENGLISH": "Дизайнер кошмаров", "OCCUPATION_SPANISH": "Diseña pesadillas", "OCCUPATION_CHINESE": "噩梦设计师", "APPEARANCE_CHINESE": "外貌:-* 二十四个手指-* 很多眼睛-* 小鼻子-* 戴耳环-* 双手放在头上", "APPEARANCE_ENGLISH": "Внешность:-* 24 пальца-* Много глаз-* Маленький нос-* Носит серьги-* Руки на голове", "APPEARANCE_SPANISH": "Apariencia:-* 24 dedos-* Muchos ojos-* Nariz pequeña-* Usa pendientes-* Manos en la cabeza"}
const BARBATOS_DATA = {"NAME": "Барбатос", "LAST_NAME": "Баррабам", "ID_NUMBER": "896689886989", "ID_EXPIRATION": "06/1972","APARTMENT_NUMBER_ENGLISH": "F01-02", "APARTMENT_NUMBER_SPANISH": "P01-02", "PHONE_NUMBER": "2668", "OCCUPATION_ENGLISH": "Охотник на людей", "OCCUPATION_SPANISH": "Cazador de humanos", "OCCUPATION_CHINESE": "人类猎人" , "APPEARANCE_CHINESE": "外貌:-* 15个山峰-* 小鼻子-* 两个纹身-* 大牙齿-* 小眼睛", "APPEARANCE_ENGLISH": "Внешность:-* 15 шипов-* Маленький нос-* Две татуировки-* Большие зубы-* Маленькие глаза", "APPEARANCE_SPANISH": "Apariencia:-* 15 picos-* Nariz pequeña-* Dos tatuajes-* Dientes grandes-* Ojos pequeños"}
const EXAEL_DATA = {"NAME": "Эксаель", "LAST_NAME": "Ланитро", "ID_NUMBER": "235325968986", "ID_EXPIRATION": "11/1976","APARTMENT_NUMBER_ENGLISH": "F01-02", "APARTMENT_NUMBER_SPANISH": "P01-02", "PHONE_NUMBER": "2668", "OCCUPATION_ENGLISH": "Мучитель", "OCCUPATION_SPANISH": "Torturador", "OCCUPATION_CHINESE": "拷打者", "APPEARANCE_CHINESE": "外貌:-* 15根针-* 点状眉毛-* 突出的下巴-* 疲惫的眼睛-* 锋利的牙齿", "APPEARANCE_ENGLISH": "Внешность:-* 15 игл-* Точечные брови-* Выдающийся подбородок-* Уставшие глаза-* Острые зубы", "APPEARANCE_SPANISH": "Apariencia:-* 15 agujas-* Cejas punteadas-* Barbilla prominente-* Ojos cansados-* Dientes afilados"}
const ABDUCIUS_DATA = {"NAME": "Адбуциус", "LAST_NAME": "Мораил", "ID_NUMBER": "763764748675", "ID_EXPIRATION": "12/1968","APARTMENT_NUMBER_ENGLISH": "F01-03", "APARTMENT_NUMBER_SPANISH": "P01-03", "PHONE_NUMBER": "5513", "OCCUPATION_ENGLISH": "Калечащий", "OCCUPATION_SPANISH": "Mutilador", "OCCUPATION_CHINESE": "肢体切割者", "APPEARANCE_CHINESE": "外貌:-* 鼻子上的疤痕-* 有穿孔-* 拉伸的眼皮-* 微笑大", "APPEARANCE_ENGLISH": "Внешность:-* Шрам на носу-* Есть пирсинг-* Растянутые веки-* Большая улыбка", "APPEARANCE_SPANISH": "Apariencia:-* Cicatriz por nariz-* Tiene perforaciones-* Párpados estirados-* Sonrisa grande"}
const LILITH_DATA = {"NAME": "Лилит", "LAST_NAME": "Лилити Лилит", "ID_NUMBER": "172535271725", "ID_EXPIRATION": "10/1967", "APARTMENT_NUMBER_ENGLISH": "F01-04", "APARTMENT_NUMBER_SPANISH": "P01-04", "PHONE_NUMBER": "6996", "OCCUPATION_ENGLISH": "Ведьма", "OCCUPATION_SPANISH": "Bruja", "OCCUPATION_CHINESE": "巫婆", "APPEARANCE_CHINESE": "外貌:-* 小而尖的鼻子-* 尖耳朵-* 戴耳环-* 五只眼睛纹身-* 有獠牙", "APPEARANCE_ENGLISH": "Внешность:-* Маленький заостренный нос-* Заостренные уши-* Носит серьги-* 5 татуировок глаз-* Есть клыки", "APPEARANCE_SPANISH": "Apariencia:-* Nariz pequeña y puntiaguda-* Orejas puntiagudas-* Usa pendientes-* 5 ojos tatuados-* Tiene colmillos"}
const ANAZARETH_DATA = {"NAME": "Аназарет", "LAST_NAME": "Аназарел", "ID_NUMBER": "435612349876", "ID_EXPIRATION": "03/1969", "APARTMENT_NUMBER_ENGLISH": "F01-04", "APARTMENT_NUMBER_SPANISH": "P01-04", "PHONE_NUMBER": "6996", "OCCUPATION_ENGLISH": "Создаёт проклятья", "OCCUPATION_SPANISH": "Crea maldiciones", "OCCUPATION_CHINESE": "创造诅咒", "APPEARANCE_CHINESE": "外貌:-* 小而尖的鼻子-* 有七只角-* 戴耳环-* 三个纹身-* 锋利的牙齿", "APPEARANCE_ENGLISH": "Внешность:-* Маленький заостренный нос-* Есть 7 рогов-* Носит серьги-* Три татуировки-* Острые зубы", "APPEARANCE_SPANISH": "Apariencia:-* Nariz pequeña y puntiaguda-* Tiene 7 cuernos-* Usa pendientes-* Tres tatuajes-* Dientes afilados"}
const YOG_DATA = {"NAME": "Уог", "LAST_NAME": "Сотот", "ID_NUMBER": "689547464823", "ID_EXPIRATION": "04/1973", "APARTMENT_NUMBER_ENGLISH": "F02-04", "APARTMENT_NUMBER_SPANISH": "P02-04", "PHONE_NUMBER": "1346", "OCCUPATION_ENGLISH": "Вампиризм", "OCCUPATION_SPANISH": "Vampirismo", "OCCUPATION_CHINESE": "吸血鬼主义", "APPEARANCE_CHINESE": "外貌:-* 长鼻子-* 鼻环-* 遮蔽的眼睛-* 短发-* 有獠牙", "APPEARANCE_ENGLISH": "Внешность:-* Длинный нос-* Кольцо в носу-* Тени на глазах-* Короткие волосы-* Есть клыки", "APPEARANCE_SPANISH": "Apariencia:-* Nariz larga-* Argolla en nariz-* Ojos sombreados-* Cabello corto-* Tiene colmillos"}
const QUACHIL_DATA = {"NAME": "Квачил", "LAST_NAME": "Уттаус", "ID_NUMBER": "636463636463", "ID_EXPIRATION": "08/1982","APARTMENT_NUMBER_ENGLISH": "F02-04", "APARTMENT_NUMBER_SPANISH": "P02-04", "PHONE_NUMBER": "1346", "OCCUPATION_ENGLISH": "Вызывает несчастья", "OCCUPATION_SPANISH": "Provoca desgracias", "OCCUPATION_CHINESE": "招致厄运", "APPEARANCE_CHINESE": "外貌:-* 九只眼睛-* 漂浮-* 有光环-* 以心灵感应说话", "APPEARANCE_ENGLISH": "Внешность:-* 9 глаз-* Летает-* Имеет нимб-* Разговаривает телепатически", "APPEARANCE_SPANISH": "Apariencia:-* 9 ojos-* Levita-* Tiene un halo-* habla por telepatía"}
const CHAUGNAR_DATA = {"NAME": "Чаугнар", "LAST_NAME": "Фаугн", "ID_NUMBER": "456989632368", "ID_EXPIRATION": "01/1971","APARTMENT_NUMBER_ENGLISH": "F02-01", "APARTMENT_NUMBER_SPANISH": "P02-01","PHONE_NUMBER": "5123","OCCUPATION_ENGLISH": "Оккультист","OCCUPATION_SPANISH": "Ocultista", "OCCUPATION_CHINESE": "神秘主义者","APPEARANCE_CHINESE": "外貌:-* 它有一个长鼻子-* 1 个纹身-* 2 根长牙-* 大耳朵","APPEARANCE_ENGLISH": "Внешность:-* Имеет хобот-* 1 татуировка-* 2 бивня-* Большие уши","APPEARANCE_SPANISH": "Apariencia:-* Tiene una trompa-* 1 tatuaje-* 2 colmillos-* Orejas grandes"}
const NYOGTHA_DATA = {"NAME": "Нёгта", "LAST_NAME": "Зе'мог", "ID_NUMBER": "986463213811","ID_EXPIRATION": "02/1965","APARTMENT_NUMBER_ENGLISH": "F02-01", "APARTMENT_NUMBER_SPANISH": "P02-01","PHONE_NUMBER": "5123","OCCUPATION_ENGLISH": "Могильщик","OCCUPATION_SPANISH": "Sepulturera","OCCUPATION_CHINESE": "女掘墓人","APPEARANCE_CHINESE": "外貌:-* 圆鼻子-* 多处疤痕-* 卷发-* 圆头-* 细眉毛","APPEARANCE_ENGLISH": "Внешность:-* Круглый нос-* Несколько шрамов-* Кудрявые волосы-* Круглая голова-* Тонкие брови","APPEARANCE_SPANISH": "Apariencia:-* Nariz redonda-* Varias cicatrices-* Cabello rizado-* Cabeza redonda-* Cejas delgadas"}
const ZOTH_DATA = {"NAME": "Зот", "LAST_NAME": "Оммог", "ID_NUMBER": "456325638947","ID_EXPIRATION": "03/1974","APARTMENT_NUMBER_ENGLISH": "F02-02", "APARTMENT_NUMBER_SPANISH": "P02-02","PHONE_NUMBER": "7332","OCCUPATION_ENGLISH": "Занимается ритуалами","OCCUPATION_SPANISH": "Ritualista","OCCUPATION_CHINESE": "仪式专家","APPEARANCE_CHINESE": "外貌:-* 大笑容-* 大鼻子-* 小手放在下巴上-* 尖头","APPEARANCE_ENGLISH": "Внешность:-* Большая улыбка-* Большой нос-* Маленькие руки на подбородке-* Заостренная голова","APPEARANCE_SPANISH": "Apariencia:-* Sonrisa grande-* Nariz grande-* Manitas en la barbilla-* Cabeza puntiaguda"}
const SHUB_DATA = {"NAME": "Шуб","LAST_NAME": "Ниггурат","ID_NUMBER": "156894755236","ID_EXPIRATION": "12/1981","APARTMENT_NUMBER_ENGLISH": "F02-03", "APARTMENT_NUMBER_SPANISH": "P02-03","PHONE_NUMBER": "6431","OCCUPATION_ENGLISH": "Вызывает голод","OCCUPATION_SPANISH": "Genera hambruna","OCCUPATION_CHINESE": "引发饥荒","APPEARANCE_CHINESE": "外貌:-* 额头上的纹身-* 小鼻子-* 大笑容-* 七条蛇-* 圆头","APPEARANCE_ENGLISH": "Внешность:-* Татуировка на лбу-* Маленький нос-* Большая улыбка-* 7 змей-* Круглая голова","APPEARANCE_SPANISH": "Apariencia:-* Tatuaje en la frente-* Nariz pequeña-* Sonrisa grande-* 7 serpientes-* Cabeza redonda"}
const YAN_DATA = {"NAME": "Ян Луо","LAST_NAME": "Ван Дию","ID_NUMBER": "798654298466","ID_EXPIRATION": "04/1968","APARTMENT_NUMBER_ENGLISH": "F03-01", "APARTMENT_NUMBER_SPANISH": "P03-01","PHONE_NUMBER": "1425","OCCUPATION_ENGLISH": "Принцесса Смерти","OCCUPATION_SPANISH": "Princesa muerte","OCCUPATION_CHINESE": "死亡公主","APPEARANCE_CHINESE": "外貌:-* 小鼻子-* 颊部牙齿-* 细眉毛-* 没有瞳孔-*锋利的牙齿","APPEARANCE_ENGLISH": "Внешность:-* Маленький нос-* Зубы на щеках-* Тонкие брови-* Нет зрачков-* Острые зубы","APPEARANCE_SPANISH": "Apariencia:-* Nariz pequeña-* Dientes en las mejillas-* Cejas delgadas-* No tiene pupilas-* Dientes afilados"}
const ORCUS_DATA = {"NAME": "Оркус","LAST_NAME": "Дис Патер","ID_NUMBER": "632525984964","ID_EXPIRATION": "11/1967","APARTMENT_NUMBER_ENGLISH": "F03-01", "APARTMENT_NUMBER_SPANISH": "P03-01","PHONE_NUMBER": "1425","OCCUPATION_ENGLISH": "Собирает кожи","OCCUPATION_SPANISH": "Colecciona pieles","OCCUPATION_CHINESE": "收集皮肤","APPEARANCE_CHINESE": "外貌:-* 戴着面具-* 发亮的眼睛-* 长长的笑容-* 深色皮肤","APPEARANCE_ENGLISH": "Внешность:-* Носит маску-* Яркие глаза-* Длинная улыбка-* Тёмная кожа","APPEARANCE_SPANISH": "Apariencia:-* Usa una máscara-* Ojos luminosos-* Sonrisa larga-* Piel oscura"}
const ISHTAR_DATA = {"NAME": "Иштар","LAST_NAME": "Ерескигал","ID_NUMBER": "945269858896","ID_EXPIRATION": "04/1966","APARTMENT_NUMBER_ENGLISH": "F03-02","APARTMENT_NUMBER_SPANISH": "P03-02","PHONE_NUMBER": "4122","OCCUPATION_ENGLISH": "Призывает вредителей","OCCUPATION_SPANISH": "Causa plagas","OCCUPATION_CHINESE": "引起瘟疫","APPEARANCE_CHINESE": "外貌:-* 长鼻子-* 长笑容-* 圆头-* 卷发-* 大眼睛","APPEARANCE_ENGLISH": "Внешность:-* Длинный нос-* Длинная улыбка-* Круглая голова-* Кудрявые волосы-* Большие глаза","APPEARANCE_SPANISH": "Apariencia:-* Nariz larga-* Sonrisa larga-* Cabeza redonda-* Cabello rizado-* Ojos grandes"}
const TEUTATES_DATA = {"NAME": "Теутатес","LAST_NAME": "Таранис","ID_NUMBER": "789586413294","ID_EXPIRATION": "06/1963","APARTMENT_NUMBER_ENGLISH": "F03-03","APARTMENT_NUMBER_SPANISH": "P03-03","PHONE_NUMBER": "4242","OCCUPATION_ENGLISH": "Уничтожитель","OCCUPATION_SPANISH": "Aniquilador","OCCUPATION_CHINESE": "消灭者","APPEARANCE_CHINESE": "外貌:-* 脸上的纹身-* 严肃的目光-* 长鼻子-* 尖牙-* 长发","APPEARANCE_ENGLISH": "Внешность:-* Татуировки на лице-* Серьёзный взгляд-* Длинный нос-* Острые зубы-* Длинные волосы","APPEARANCE_SPANISH": "Apariencia:-* Tatuajes en la cara-* Mirada seria-* Nariz larga-* Dientes afilados-* Cabello largo"}
const PUCH_DATA = {"NAME": "А Пух","LAST_NAME": "Ксилбалба","ID_NUMBER": "564895213647","ID_EXPIRATION": "12/1982","APARTMENT_NUMBER_ENGLISH": "F03-03","APARTMENT_NUMBER_SPANISH": "P03-03","PHONE_NUMBER": "4242","OCCUPATION_ENGLISH": "Костолом","OCCUPATION_SPANISH": "Rompe huesos","OCCUPATION_CHINESE": "打破骨头","APPEARANCE_CHINESE": "外貌:-* 戴面具-* 圆头-* 短发-* 圆耳朵-* 小眼睛","APPEARANCE_ENGLISH": "Внешность:-* Носит маску-* Круглая голова-* Короткие волосы-* Круглые уши-* Маленькие глаза","APPEARANCE_SPANISH": "Apariencia:-* Usa máscara-* Cabeza redonda-* Cabello corto-* Orejas redondas-* Ojos pequeños"}
const DAGDA_DATA = {"NAME": "Дагда","LAST_NAME": "Кром Круач","ID_NUMBER": "965845863219","ID_EXPIRATION": "11/1975","APARTMENT_NUMBER_ENGLISH": "F03-04","APARTMENT_NUMBER_SPANISH": "P03-04","PHONE_NUMBER": "4258","OCCUPATION_ENGLISH": "Пугало для душ","OCCUPATION_SPANISH": "Espanta almas","OCCUPATION_CHINESE": "驱魂者","APPEARANCE_CHINESE": "外貌:-* 戴帽子-* 嘴巴上的缝线-* 大头-* 戴着面具","APPEARANCE_ENGLISH": "Внешность:-* Носит шляпу-* Швы на рту-* Большая голова-* Носит маску","APPEARANCE_SPANISH": "Apariencia:-* Usa sombrero-* Costuras en la boca-* Cabeza grande-* Usa una máscara"}
const IZANAMI_DATA = {"NAME": "Изанами","LAST_NAME": "Ёми","ID_NUMBER": "235689986532","ID_EXPIRATION": "12/1986","APARTMENT_NUMBER_ENGLISH": "F03-04","APARTMENT_NUMBER_SPANISH": "P03-04","PHONE_NUMBER": "4258","OCCUPATION_ENGLISH": "Меняет лица","OCCUPATION_SPANISH": "Deforma caras","OCCUPATION_CHINESE": "变形面孔","APPEARANCE_CHINESE": "外貌:-* 长发-* 大鼻子-* 圆下巴-* 苍白的脸","APPEARANCE_ENGLISH": "Внешность:-* Длинные волосы-* Большой нос-* Круглый подбородок-* Бледное лицо","APPEARANCE_SPANISH": "Apariencia:-* Cabello largo-* Nariz grande-* Barbilla redonda-* Rostro pálido"}
const CHAR_LIST = ["Roman_Stilnsky", "Lois_Stilnsky", "Margarette_Bubbles", "Alf_Cappuccin", "Elenois_Sverchzt", "Selenne_Sverchzt","Izaack_Gauss","Rafttelyn_Cappuccin","Arnold_Schmicht","Gloria_Schmicht","Robertosky_Peachman","Albertosky_Peachman","Mia_Stone","Dr_W_Afton","Angus_Ciprianni","Francis_Mosses","Anastacha_Mikaelys","Nacha_Mikaelys","Steven_Rudboys","Mclooy_Rudboys"]
const SPECIAL_LIST = ["Clown","Chester"]
const SAVE_SETTINGS_PATH = "user://data_settings.save"
const SAVE_SETTINGS_02_PATH = "user://data_settings_02.save"
const SAVE_SETTINGS_03_PATH = "user://data_settings_03.save"
const SAVE_SETTINGS_04_PATH = "user://data_settings_04.save"
const SAVE_RECORD_PATH = "user://data_record.save"
const SAVE_RECORD_02_PATH = "user://data_record_02.save"
const SAVE_ACHIEVEMENTS_PATH = "user://data_achievements.save"
const SAVE_ACHIEVEMENTS_02_PATH = "user://data_achievements_02.save"
const SIZE_960X540 = Vector2i(960, 540)
const SIZE_1280X720 = Vector2i(1280, 720)
const SIZE_1920X1080 = Vector2i(1920, 1080)
var scene = 0
var language = 0 # 0: inglés, 1: español, 2: chino
var sound_level = -2
var music_level = -12
var window_size = 3 # 0 : 960x540, 1: 1280x720, 2: 1920x1080, 3: fullscreen
var phone_numbers = [3312,1152,6431,4258,6996,7332,5123,2668,1425,5513,4122,1346,4242]
var accessibility_option = false
var accessibility_option_2 = false
var is_door_locked = true
var tutorial_phone = true 
var checklist_complete = false
var neighbor_gone = false
var neighbor_in = false
var start_tutorial = true #if true the DDD agent tutorial will happens
var today_list = []
var char_ddd_list = []
var char_at_home_list = ["Roman_Stilnsky","Lois_Stilnsky","Margarette_Bubbles","Alf_Cappuccin","Elenois_Sverchzt","Selenne_Sverchzt","Izaack_Gauss","Rafttelyn_Cappuccin","Arnold_Schmicht","Gloria_Schmicht","Robertosky_Peachman","Albertosky_Peachman","Mia_Stone","Dr_W_Afton","Angus_Ciprianni","Francis_Mosses","Anastacha_Mikaelys","Nacha_Mikaelys","Steven_Rudboys","Mclooy_Rudboys"]
var char_out_home_list = []
var char_not_today_list = ["Roman_Stilnsky","Alf_Cappuccin","Elenois_Sverchzt","Selenne_Sverchzt","Arnold_Schmicht","Gloria_Schmicht","Robertosky_Peachman","Albertosky_Peachman","Mia_Stone","Dr_W_Afton","Nacha_Mikaelys","Steven_Rudboys","Mclooy_Rudboys","Izaack_Gauss","Angus_Ciprianni","Margarette_Bubbles","Francis_Mosses"]
var is_id_wrong_answer = false # Check if already do the question about id
var is_appearance_wrong_answer = false # Check if already do the question about appearance
var is_entry_request_wrong_answer = false # Check if already do the question about entry request
var is_today_list_wrong_answer = false # Check if already do the question about today list
var doppel_captured_record = 0
var doppel_entered_record = 0
var chars_killed_record = 0
var days_killed_record = 0
var days_successfully_complete_record = 0
var S_rank_record = 0
var A_rank_record = 0
var B_rank_record = 0
var C_rank_record = 0
var D_rank_record = 0
var E_rank_record = 0
var F_rank_record = 0
var doppel_captured_level = 0
var chars_killed_level = 0
var doppel_entered_level = 0
var is_3312_active = false
var unlikely = false
var badge = false
var secret = false
var evil_badge = false
var doppels_on_level = 0
var chars_on_level = 0
var achievements = {"S_RANK":0,"KILL_NEIGHBOR":0,"BE_KILLED":0,"100_DOPPELS":0,"ALIVE":0,"NO_FOLDER":0,"CHESTER_QUIZ":0,"UNLIKELY":0,"40_DAYS":0,"F_RANK":0,"100_DAYS":0,"CATCH_DOPPEL":0,"42":0,"PEACH":0,"ALL":0}
var achievements_2 = {"EVIL_CHESTER":0,"SECRET":0,"HAUNTED":0,"NIGHTMARE":0,"ENTITY":0,"42":0,"PEACH":0,"NURSE":0}
var did_folder_opened = false
var save_file_exist = false
var is_first_load = true
var doppels_info = ""
var fixed_camera = false
var small_textbox = false
var tripo = false
var neighbors_killed_info = ""
var ghost_count = 0
var killed_by_clown = false
var entity_spawn = false
var is_nightmare = false
var epilepsy = false

func update_char_at_home_list() -> void:
	for char_obj in char_out_home_list:
		char_at_home_list.erase(char_obj)
		if char_obj in char_not_today_list:
			char_not_today_list.erase(char_obj)

func reset_values() -> void:
	is_door_locked = true
	checklist_complete = false
	neighbor_gone = false
	neighbor_in = false
	start_tutorial = true #if true the DDD agent tutorial will happens
	today_list = []
	char_ddd_list = []
	char_at_home_list = ["Roman_Stilnsky", "Lois_Stilnsky", "Margarette_Bubbles", "Alf_Cappuccin", "Elenois_Sverchzt", "Selenne_Sverchzt", "Izaack_Gauss","Rafttelyn_Cappuccin","Arnold_Schmicht","Gloria_Schmicht","Robertosky_Peachman","Albertosky_Peachman","Mia_Stone","Dr_W_Afton","Angus_Ciprianni","Francis_Mosses","Anastacha_Mikaelys","Nacha_Mikaelys","Steven_Rudboys","Mclooy_Rudboys"]
	char_out_home_list = []
	char_not_today_list = ["Roman_Stilnsky","Alf_Cappuccin","Elenois_Sverchzt","Selenne_Sverchzt","Arnold_Schmicht","Gloria_Schmicht","Robertosky_Peachman","Albertosky_Peachman","Mia_Stone","Dr_W_Afton","Nacha_Mikaelys","Steven_Rudboys","Mclooy_Rudboys","Izaack_Gauss","Angus_Ciprianni","Margarette_Bubbles","Francis_Mosses"]
	is_id_wrong_answer = false # Check if already do the question about id
	is_appearance_wrong_answer = false # Check if already do the question about appearance
	is_entry_request_wrong_answer = false # Check if already do the question about entry request
	is_today_list_wrong_answer = false # Check if already do the question about today list
	doppel_captured_level = 0
	chars_killed_level = 0
	doppel_entered_level = 0
	doppels_on_level = 0
	chars_on_level = 0
	is_3312_active = false
	did_folder_opened = false
	doppels_info = ""
	neighbors_killed_info = ""
	ghost_count = 0
	killed_by_clown = false
	entity_spawn = false
	is_nightmare = false

func load_settings() -> void:
	var current_screen
	if FileAccess.file_exists(SAVE_SETTINGS_PATH):
		var file = FileAccess.open(SAVE_SETTINGS_PATH,FileAccess.READ)
		language = file.get_var(language)
		sound_level = file.get_var(sound_level)
		music_level = file.get_var(music_level)
		window_size = file.get_var(window_size)
		current_screen = DisplayServer.window_get_current_screen()
		var screen_size = DisplayServer.screen_get_size()
		if window_size != 3:
			@warning_ignore("int_as_enum_without_cast")
			DisplayServer.window_set_mode(0,0) 
		else:
			@warning_ignore("int_as_enum_without_cast")
			DisplayServer.window_set_mode(3,0)
		if window_size == 0:
			DisplayServer.window_set_size(SIZE_960X540)
			if screen_size != Vector2i(1280,720):
				DisplayServer.window_set_position(Vector2i(screen_size.x/2-480,screen_size.y/2-270),0)
			else:
				DisplayServer.window_set_position(Vector2i(0,0),0)
		elif window_size == 1:
			DisplayServer.window_set_size(SIZE_1280X720)
			if screen_size != Vector2i(1280,720):
				DisplayServer.window_set_position(Vector2i(screen_size.x/2-640,screen_size.y/2-360),0)
			else:
				DisplayServer.window_set_position(Vector2i(0,0),0)
		elif window_size == 2:
			DisplayServer.window_set_size(SIZE_1920X1080)
			if screen_size != Vector2i(1920,1080):
				DisplayServer.window_set_position(Vector2i(screen_size.x/2-810,screen_size.y/2-540),0)
			else:
				DisplayServer.window_set_position(Vector2i(0,0),0)
		DisplayServer.window_set_current_screen(current_screen)
		accessibility_option = file.get_var(accessibility_option)
		accessibility_option_2 = file.get_var(accessibility_option_2)
		save_file_exist = true
	else:
		language = 0
		sound_level = -2
		music_level = -12
		window_size = 3
		accessibility_option = false
		accessibility_option_2 = false
	if FileAccess.file_exists(SAVE_SETTINGS_02_PATH):
		var file_2 = FileAccess.open(SAVE_SETTINGS_02_PATH,FileAccess.READ)
		fixed_camera = file_2.get_var(fixed_camera)
		small_textbox = file_2.get_var(small_textbox)
	else:
		fixed_camera = false
		small_textbox = false
	if FileAccess.file_exists(SAVE_SETTINGS_03_PATH):
		var file_3 = FileAccess.open(SAVE_SETTINGS_03_PATH,FileAccess.READ)
		tripo = file_3.get_var(tripo)
	else:
		tripo = false
	if FileAccess.file_exists(SAVE_SETTINGS_04_PATH):
		var file_4 = FileAccess.open(SAVE_SETTINGS_04_PATH,FileAccess.READ)
		epilepsy = file_4.get_var(epilepsy)
	else:
		epilepsy = false

func load_record() -> void:
	if FileAccess.file_exists(SAVE_RECORD_PATH):
		var file = FileAccess.open(SAVE_RECORD_PATH,FileAccess.READ)
		tutorial_phone = file.get_var(tutorial_phone)
		unlikely = file.get_var(unlikely)
		badge = file.get_var(badge)
		doppel_captured_record = file.get_var(doppel_captured_record)
		doppel_entered_record = file.get_var(doppel_entered_record)
		chars_killed_record = file.get_var(chars_killed_record)
		days_killed_record = file.get_var(days_killed_record)
		days_successfully_complete_record = file.get_var(days_successfully_complete_record)
		S_rank_record = file.get_var(S_rank_record)
		A_rank_record = file.get_var(A_rank_record)
		B_rank_record = file.get_var(B_rank_record)
		C_rank_record = file.get_var(C_rank_record)
		D_rank_record = file.get_var(D_rank_record)
		E_rank_record = file.get_var(E_rank_record)
		F_rank_record = file.get_var(F_rank_record)
	else:
		tutorial_phone = true
		unlikely = false
		badge = false
		doppel_captured_record = 0
		doppel_entered_record = 0
		chars_killed_record = 0
		days_killed_record = 0
		days_successfully_complete_record = 0
		S_rank_record = 0
		A_rank_record = 0
		B_rank_record = 0
		C_rank_record = 0
		D_rank_record = 0
		E_rank_record = 0
		F_rank_record = 0
	if FileAccess.file_exists(SAVE_RECORD_02_PATH):
		var file2 = FileAccess.open(SAVE_RECORD_02_PATH,FileAccess.READ)
		secret = file2.get_var(secret)
		evil_badge = file2.get_var(evil_badge)
	else:
		secret = false
		evil_badge = false

func load_achievements() -> void:
	if FileAccess.file_exists(SAVE_ACHIEVEMENTS_PATH):
		var file = FileAccess.open(SAVE_ACHIEVEMENTS_PATH,FileAccess.READ)
		achievements["S_RANK"] = file.get_var(achievements["S_RANK"])
		achievements["KILL_NEIGHBOR"] = file.get_var(achievements["KILL_NEIGHBOR"])
		achievements["BE_KILLED"] = file.get_var(achievements["BE_KILLED"])
		achievements["100_DOPPELS"] = file.get_var(achievements["100_DOPPELS"])
		achievements["ALIVE"] = file.get_var(achievements["ALIVE"])
		achievements["NO_FOLDER"] = file.get_var(achievements["NO_FOLDER"])
		achievements["CHESTER_QUIZ"] = file.get_var(achievements["CHESTER_QUIZ"])
		achievements["UNLIKELY"] = file.get_var(achievements["UNLIKELY"])
		achievements["40_DAYS"] = file.get_var(achievements["40_DAYS"])
		achievements["F_RANK"] = file.get_var(achievements["F_RANK"])
		achievements["100_DAYS"] = file.get_var(achievements["100_DAYS"])
		achievements["CATCH_DOPPEL"] = file.get_var(achievements["CATCH_DOPPEL"])
		achievements["42"] = file.get_var(achievements["42"])
		achievements["PEACH"] = file.get_var(achievements["PEACH"])
		achievements["ALL"] = file.get_var(achievements["ALL"])
	else:
		achievements = {"S_RANK":0,"KILL_NEIGHBOR":0,"BE_KILLED":0,"100_DOPPELS":0,"ALIVE":0,"NO_FOLDER":0,"CHESTER_QUIZ":0,"UNLIKELY":0,"40_DAYS":0,"F_RANK":0,"100_DAYS":0,"CATCH_DOPPEL":0,"42":0,"PEACH":0,"ALL":0}
	if FileAccess.file_exists(SAVE_ACHIEVEMENTS_02_PATH):
		var file2 = FileAccess.open(SAVE_ACHIEVEMENTS_02_PATH,FileAccess.READ)
		achievements_2["EVIL_CHESTER"] = file2.get_var(achievements_2["EVIL_CHESTER"])
		achievements_2["SECRET"] = file2.get_var(achievements_2["SECRET"])
		achievements_2["HAUNTED"] = file2.get_var(achievements_2["HAUNTED"])
		achievements_2["NIGHTMARE"] = file2.get_var(achievements_2["NIGHTMARE"])
		achievements_2["ENTITY"] = file2.get_var(achievements_2["ENTITY"])
		achievements_2["42"] = file2.get_var(achievements_2["42"])
		achievements_2["PEACH"] = file2.get_var(achievements_2["PEACH"])
		achievements_2["NURSE"] = file2.get_var(achievements_2["NURSE"])
	else:
		achievements_2 = {"EVIL_CHESTER":0,"SECRET":0,"HAUNTED":0,"NIGHTMARE":0,"ENTITY":0,"42":0,"PEACH":0,"NURSE":0}

func save_settings() -> void:
	var file = FileAccess.open(SAVE_SETTINGS_PATH,FileAccess.WRITE)
	file.store_var(language)
	file.store_var(sound_level)
	file.store_var(music_level)
	file.store_var(window_size)
	file.store_var(accessibility_option)
	file.store_var(accessibility_option_2)
	file = FileAccess.open(SAVE_SETTINGS_02_PATH,FileAccess.WRITE)
	file.store_var(fixed_camera)
	file.store_var(small_textbox)
	file = FileAccess.open(SAVE_SETTINGS_03_PATH,FileAccess.WRITE)
	file.store_var(tripo)
	file = FileAccess.open(SAVE_SETTINGS_04_PATH,FileAccess.WRITE)
	file.store_var(epilepsy)

func save_record() -> void:
	var file = FileAccess.open(SAVE_RECORD_PATH,FileAccess.WRITE)
	file.store_var(tutorial_phone)
	file.store_var(unlikely)
	file.store_var(badge)
	file.store_var(doppel_captured_record)
	file.store_var(doppel_entered_record)
	file.store_var(chars_killed_record)
	file.store_var(days_killed_record)
	file.store_var(days_successfully_complete_record)
	file.store_var(S_rank_record)
	file.store_var(A_rank_record)
	file.store_var(B_rank_record)
	file.store_var(C_rank_record)
	file.store_var(D_rank_record)
	file.store_var(E_rank_record)
	file.store_var(F_rank_record)
	var file2 = FileAccess.open(SAVE_RECORD_02_PATH,FileAccess.WRITE)
	file2.store_var(secret)
	file2.store_var(evil_badge)

func save_achievements() -> void:
	var file = FileAccess.open(SAVE_ACHIEVEMENTS_PATH,FileAccess.WRITE)
	file.store_var(achievements["S_RANK"])
	file.store_var(achievements["KILL_NEIGHBOR"])
	file.store_var(achievements["BE_KILLED"])
	file.store_var(achievements["100_DOPPELS"])
	file.store_var(achievements["ALIVE"])
	file.store_var(achievements["NO_FOLDER"])
	file.store_var(achievements["CHESTER_QUIZ"])
	file.store_var(achievements["UNLIKELY"])
	file.store_var(achievements["40_DAYS"])
	file.store_var(achievements["F_RANK"])
	file.store_var(achievements["100_DAYS"])
	file.store_var(achievements["CATCH_DOPPEL"])
	file.store_var(achievements["42"])
	file.store_var(achievements["PEACH"])
	file.store_var(achievements["ALL"])
	var file2 = FileAccess.open(SAVE_ACHIEVEMENTS_02_PATH,FileAccess.WRITE)
	file2.store_var(achievements_2["EVIL_CHESTER"])
	file2.store_var(achievements_2["SECRET"])
	file2.store_var(achievements_2["HAUNTED"])
	file2.store_var(achievements_2["NIGHTMARE"])
	file2.store_var(achievements_2["ENTITY"])
	file2.store_var(achievements_2["42"])
	file2.store_var(achievements_2["PEACH"])
	file2.store_var(achievements_2["NURSE"])
