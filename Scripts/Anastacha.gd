extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100,200)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(995,280)
const CHAR_AT_DELETE_POS = Vector2(1900,280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Анастация"
const FAKE_NAME_02 = "Анастасия"
const FAKE_NAME_03 = "Настача"
const FAKE_LAST_NAME_01 = "Микаела"
const FAKE_LAST_NAME_02 = "Микаели"
const FAKE_LAST_NAME_03 = "Никаелис"
const ENTRY_REASON_ENGLISH = "Я живу здесь, вроде того.\nМоя квартира 04 \nна втором этаже."
const ENTRY_REASON_SPANISH = "Vivo aquí, lo que sea.\nMi apartamento es el 04 del \nsegundo piso."
const ENTRY_REASON_CHINESE = "我住在这里，哦无论如何。\n我的公寓在二楼的04号。"
const ENTRY_REASON_02_ENGLISH = "Я живу здесь, вроде того.\nЯ пришла со школы."
const ENTRY_REASON_02_SPANISH = "Vivo aquí, lo que sea.\nVengo de la escuela."
const ENTRY_REASON_02_CHINESE = "我住在这里，哦无论如何。\n我出门去上学了。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "Я живу здесь, вроде того.\nМоя квартира 04 \nна первом этаже."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Vivo aquí, lo que sea.\nMi apartamento es el 04 del \nprimer piso."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我住在这里，哦无论如何。\n我的公寓在一楼的04号。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "Я не доппельгангер. \nЯ нормальный человек с \nнормальным поведением. \nПросто впусти меня, чтобы я могла заниматься \nсвоими обычными человеческими делами."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No soy un doppelganger. \nSoy un humano normal con \ncomportamiento normal. \nSolo déjame entrar, para hacer \nmis actividades de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是假人。\n我是一个正常的人类，有着正常的行为。\n请让我进去，进行我的正常人类活动。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "Я живу здесь, вроде того.\nЯ пришла с работы учителем."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Vivo aquí, lo que sea.\nVengo de mi trabajo como maestra."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我住在这里，哦无论如何。\n我出门去上班，我是一名教师。"
const FAKE_ID_01 = "13269853462"
const FAKE_ID_02 = "132698535462"
const FAKE_ID_03 = "132698853462"
const FAKE_APARTMENT_ENGLISH_01 = "F20-04"
const FAKE_APARTMENT_ENGLISH_02 = "F01-04"
const FAKE_APARTMENT_ENGLISH_03 = "F12-04"
const FAKE_APARTMENT_SPANISH_01 = "P20-04"
const FAKE_APARTMENT_SPANISH_02 = "P01-04"
const FAKE_APARTMENT_SPANISH_03 = "P12-04"
const FAKE_DATE_01 = "01/1955"
const FAKE_DATE_02 = "15/1985"
const FAKE_DATE_03 = "05/1885"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var eyes_sprite = $Head/Eyes
@onready var nose_sprite = $Head/Nose
@onready var head = $Head/Head
@onready var eyebrows = $Head/Eyebrows
@onready var mouth = $Head/Mouth
@onready var doppel_head = $Head/Doppel_Head
@onready var zipper = $Head/Zipper
@onready var frog_eyes = $Head/Frog_Eyes
@onready var tripo = $Head/Tripo
@onready var doppel_nose = $Head/Doppel_Nose
@onready var lot_of_eyes = $Head/Lot_of_Eyes
@onready var animation_01 = $Head/Lot_of_Eyes/third_Eye2/Animation
@onready var animation_02 = $Head/Lot_of_Eyes/third_Eye3/Animation
@onready var animation_03 = $Head/Lot_of_Eyes/third_Eye6/Animation
@onready var animation_04 = $Head/Lot_of_Eyes/third_Eye4/Animation
@onready var animation_05 = $Head/Lot_of_Eyes/third_Eye5/Animation
@onready var animation_06 = $Head/Lot_of_Eyes/third_Eye8/Animation
@onready var animation_07 = $Head/Lot_of_Eyes/third_Eye7/Animation
@onready var animation_08 = $Head/Lot_of_Eyes/third_Eye9/Animation
@onready var animation_09 = $Head/Lot_of_Eyes/third_Eye10/Animation

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["Mmmmm ¿Mi identificación?","No veo ningún problema con mi identificación.","Lo que sea."], "appearance_ok": ["Mmmm ¿Qué hay de raro con mi apariencia?","Todo está en regla con mi apariencia.","Lo que sea."], "entry_request_ok": ["Mmmm ¿Mi solicitud de ingreso?","Me parece que todo está perfecto con mi solicitud.","Lo que sea"], "today_list_ok": ["Mmmm ¿No estoy en la lista de hoy?","Me parece que debe haber un error, si debo estar en la lista.","Mire la lista nuevamente.","Lo que sea."]}
var question_answers_english = {"id_ok": ["Ммммм. Мое удостоверение?","Я не вижу ничего неправильного в моем удостоверении.","Вроде того."], "appearance_ok": ["Мммм. Что не так с моим внешним видом?","С моим внешним видом всё в порядке.","Вроде того."], "entry_request_ok": ["Мммм. Моё разрешение на вход?","Я думаю, что с моим разрешением на вход всё в порядке.","Вроде того."], "today_list_ok": ["Мммм. Я не в сегодняшнем списке?","Я думаю, это ошибка, я должна быть в списке.","Посмотри список еще раз.","Вроде того."]}
var question_answers_chinese = {"id_ok": ["嗯嗯。我的身份证？","我觉得我的身份证没什么问题。","哦无论如何。"], "appearance_ok": ["嗯嗯。我的外貌有什么问题吗？","我觉得我的外貌一切都很好。","哦无论如何。"], "entry_request_ok": ["嗯嗯。我的入场请求？","我觉得我的入场请求没有任何问题。","哦无论如何。"], "today_list_ok": ["嗯嗯。我不是在今天的名单上吗？","一定是个错误，我应该在名单上。","再看一下名单。","哦无论如何。"]}
var entry_request_reason = ""
var hello_text_english = ["Мммм. Привет или что-то вроде того."]
var hello_text_spanish = ["Mmmm. Hola o lo que sea."]
var hello_text_chinese = ["嗯嗯。你好，哦无论如何。"]
var id_photo = load("res://Assets/Graphics/Char_Anastacha_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Anastacha_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Anastacha_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Anastacha_Long_Photo_Doppel_01.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var speak_flag = true
var name_char = Global.ANASTACHA_MIKAELYS_DATA["NAME"]
var last_name_char = Global.ANASTACHA_MIKAELYS_DATA["LAST_NAME"]
var number_id = Global.ANASTACHA_MIKAELYS_DATA["ID_NUMBER"]
var id_exp_date = Global.ANASTACHA_MIKAELYS_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.ANASTACHA_MIKAELYS_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.ANASTACHA_MIKAELYS_DATA["APARTMENT_NUMBER_ENGLISH"]
var today_list_doppel_answer = []
var dont_show_id = false
var dont_show_entry_request = false
var random_value = 0
var doppel_dont_show_id_text = [""]
var doppel_id_text = [""]
var doppel_appearance_text = [""]
var doppel_dont_show_entry_text = [""]
var doppel_entry_text = [""]
var doppel_not_today_list_text = [""]
var doppel_today_list_text = [""]
var doppel_its_all_ok_text = [""]
var doppel_appearance_no_hat_text = [""]
var doppel_appearance_no_monocle_text = [""]
var doppel_number 
var doppel_reveal_flag = false
var repeat_answer_spanish= ["Mmmm. Ya respondí su pregunta.", "Lo que sea."]
var repeat_answer_english = ["Мммм. Я уже ответила на этот вопрос.","Вроде того."]
var repeat_answer_chinese = ["嗯嗯。我已经回答了你的问题。","哦无论如何。"]
var texts_changed = false

func _ready() -> void:
	randomize()
	set_sfx_volume()
	random_value = randi_range(0,5)
	if random_value == 0:
		dont_show_id = true
	random_value = randi_range(0,5)
	if random_value == 0:
		dont_show_entry_request = true
	_set_entry_reason()
	random_value = randi_range(0,1)
	if random_value == 0:
		if Global.language == SPANISH_VALUE:
			entry_request_reason = ENTRY_REASON_02_SPANISH
		elif Global.language == ENGLISH_VALUE:
			entry_request_reason = ENTRY_REASON_02_ENGLISH
		elif Global.language == CHINESE_VALUE:
			entry_request_reason = ENTRY_REASON_02_CHINESE
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_CENTER_WINDOW_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	await get_tree().create_timer(TIME_ON_TWEEN).timeout
	if Global.is_door_locked:
		animation.play("IDLE")

func _process(_delta) -> void:
	if self.position == CHAR_AT_CENTER_WINDOW_POS:
		if !Global.is_door_locked:
			delete()
		elif speak_flag:
			_first_words()

func set_sfx_volume() -> void:
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func _first_words() -> void:
	speak_flag = false
	if !dont_show_id:
		get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
	if !dont_show_entry_request:
		if Global.language == SPANISH_VALUE:
			get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
		else:
			get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func _set_entry_reason() -> void:
	var n_random = randi_range(0,1)
	match n_random:
		0:
			if Global.language == SPANISH_VALUE:
				entry_request_reason = ENTRY_REASON_SPANISH
			elif Global.language == ENGLISH_VALUE:
				entry_request_reason = ENTRY_REASON_ENGLISH
			elif Global.language == CHINESE_VALUE:
				entry_request_reason = ENTRY_REASON_CHINESE
		1:
			if Global.language == SPANISH_VALUE:
				entry_request_reason = ENTRY_REASON_02_SPANISH
			elif Global.language == ENGLISH_VALUE:
				entry_request_reason = ENTRY_REASON_02_ENGLISH
			elif Global.language == CHINESE_VALUE:
				entry_request_reason = ENTRY_REASON_02_CHINESE
		_:
			entry_request_reason = " "

func talk() -> void:
	talking.play("TALK")
	mouth.play("TALK")

func change_current_text(n:int) -> void:
	if !is_doppelganger:
		match n:
			0:
				if Global.language == SPANISH_VALUE:
					current_text = hello_text_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = hello_text_english
				elif Global.language == CHINESE_VALUE:
					current_text = hello_text_chinese
			1:
				if Global.is_id_wrong_answer:
					_repeat_answer()
				else:
					if dont_show_id:
						dont_show_id = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Mmmm. Olvidé mostrar mi identificación.","Lo que sea."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Мммм. Я забыла показать своё удостоверение.","Вроде того."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["嗯嗯。我忘记了出示我的身份证。","哦无论如何。"]
						get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
					else:
						if Global.language == SPANISH_VALUE:
							current_text += question_answers_spanish["id_ok"]
						elif Global.language == ENGLISH_VALUE:
							current_text += question_answers_english["id_ok"]
						elif Global.language == CHINESE_VALUE:
							current_text += question_answers_chinese["id_ok"]
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else:
					if Global.language == SPANISH_VALUE:
						current_text += question_answers_spanish["appearance_ok"]
					elif Global.language == ENGLISH_VALUE:
						current_text += question_answers_english["appearance_ok"]
					elif Global.language == CHINESE_VALUE:
						current_text += question_answers_chinese["appearance_ok"]
					Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else:
					if dont_show_entry_request:
						dont_show_entry_request = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está.","Lo que sea."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Мммм. Я забыла показать своё разрешение на вход, вот оно.","Вроде того."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["嗯嗯。我忘记出示我的入境申请，请看这里。","哦无论如何。"]
						if Global.language == SPANISH_VALUE:
							get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
						else:
							get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
					else:
						if Global.language == SPANISH_VALUE:
							current_text += question_answers_spanish["entry_request_ok"]
						elif Global.language == ENGLISH_VALUE:
							current_text += question_answers_english["entry_request_ok"]
						elif Global.language == CHINESE_VALUE:
							current_text += question_answers_chinese["entry_request_ok"]
					Global.is_entry_request_wrong_answer = true
			4:
				if Global.is_today_list_wrong_answer:
					_repeat_answer()
				else:
					if Global.language == SPANISH_VALUE:
						current_text += question_answers_spanish["today_list_ok"]
					elif Global.language == ENGLISH_VALUE:
						current_text += question_answers_english["today_list_ok"]
					elif Global.language == CHINESE_VALUE:
						current_text += question_answers_chinese["today_list_ok"]
				Global.is_today_list_wrong_answer = true
			5:
				if Global.language == SPANISH_VALUE:
					current_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					current_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					current_text = ["嗯嗯。你可以帮我开门吗？","哦无论如何。"]
			-1:
				_repeat_answer()
			_:
				current_text = []
	else:
		match n:
			0:
				if Global.language == SPANISH_VALUE:
					current_text = hello_text_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = hello_text_english
				elif Global.language == CHINESE_VALUE:
					current_text = hello_text_chinese
			1:
				if Global.is_id_wrong_answer:
					_repeat_answer()
				else:
					if dont_show_id:
						current_text += doppel_dont_show_id_text
						if doppel_number in [5,6,7,8]:
							get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
					else:
						current_text += doppel_id_text
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else:
					current_text += doppel_appearance_text
				Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else:
					if dont_show_entry_request:
						current_text += doppel_dont_show_entry_text 
						if doppel_number in [5,6,7,8]:
							if Global.language == SPANISH_VALUE:
								get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
							else:
								get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
					else:
						current_text += doppel_entry_text
					Global.is_entry_request_wrong_answer = true
			4:
				if Global.is_today_list_wrong_answer:
					_repeat_answer()
				else:
					if !Global.CHAR_LIST[16] in Global.today_list:
						current_text += doppel_not_today_list_text 
					else:
						current_text += doppel_today_list_text
					Global.is_today_list_wrong_answer = true
			5:
				current_text = doppel_its_all_ok_text
			-1:
				_repeat_answer()
			_:
				current_text = []

func _repeat_answer() -> void:
	if Global.language == SPANISH_VALUE:
		current_text = repeat_answer_spanish
	elif Global.language == ENGLISH_VALUE:
		current_text = repeat_answer_english
	elif Global.language == CHINESE_VALUE:
		current_text = repeat_answer_chinese

func get_text():
	return current_text.duplicate()

func _play_sfx(n:int) -> void:
	match n:
		0: 
			sfx_voice_01.play()
		1: 
			sfx_voice_02.play()
		2: 
			sfx_voice_03.play()
		3: 
			sfx_voice_04.play()
		4:
			sfx_footsteps.play()

func play_random_sfx() -> void:
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		_play_sfx(randi_range(0,3))
		talk()
	else:
		talking.stop()
		if doppel_reveal_flag:
			if !texts_changed:
				texts_changed = true
				change_texts()
		else:
			mouth.play("CLOSE")

func delete() -> void:
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_DELETE_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	delete_free()

func delete_free() -> void:
	_record_update()
	call_deferred("queue_free")

func change_voice() -> void:
	if !doppel_reveal_flag:
		sfx_voice_01 = $Voice_05
		sfx_voice_02 = $Voice_06
		sfx_voice_03 = $Voice_07
		sfx_voice_04 = $Voice_08
		if Global.achievements["CATCH_DOPPEL"] == 0:
			Global.achievements["CATCH_DOPPEL"] = 1
			get_parent().get_parent()._show_unlock_achievement()
	doppel_reveal_flag = true

func change_texts() -> void:
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["¿Qué tanto le importan sus vecinos?","Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.","Permítame ingresar.","Usted quiere eso."]
		doppel_id_text = ["¿Qué tanto le importan sus vecinos?","Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.","Permítame ingresar.","Usted quiere eso."]
		doppel_appearance_text = ["¿Quiere ver mi forma real?","Abra la puerta y se la mostraré."]
		doppel_entry_text = ["Papeles, papeles y más papeles.","Yo puedo acabar con eso, solo debe abrir la puerta."]
		doppel_dont_show_entry_text = ["¿Quiere ver mi forma real?","Abra la puerta y se la mostraré."]
		doppel_not_today_list_text = ["¿Tiene miedo?","¿Puedo hacerle una visita en la noche mientras duerme?"]
		doppel_today_list_text = ["¿Qué tanto le importan sus vecinos?","Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.","Permítame ingresar.","Usted quiere eso."]
		doppel_its_all_ok_text = ["Esa es la decisión correcta."]
		repeat_answer_spanish = ["¿Quiere ver mi forma real?","Abra la puerta y se la mostraré."]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["Как сильно ты заботишься о своих соседях?", "Они, вероятно, даже не знают твоего имени, а ты каждый день рискуешь жизнью ради них.", "Впусти меня.", "Ты этого хочешь."]
		doppel_id_text = ["Как сильно ты заботишься о своих соседях?", "Они, вероятно, даже не знают твоего имени, а ты каждый день рискуешь жизнью ради них.", "Впусти меня.", "Ты этого хочешь."]
		doppel_appearance_text = ["Хочешь увидеть мою настоящую форму?", "Открой дверь, и я покажу её тебе."]
		doppel_dont_show_entry_text = ["Бумаги, бумаги и ещё больше бумаг.", "Я могу положить этому конец, тебе нужно лишь открыть дверь."]
		doppel_entry_text = ["Ты боишься?", "Можно я навещу тебя ночью, пока ты спишь?"]
		doppel_not_today_list_text = ["Хочешь увидеть мою настоящую форму?", "Открой дверь, и я покажу её тебе."]
		doppel_today_list_text = ["Как сильно ты заботишься о своих соседях?", "Они, вероятно, даже не знают твоего имени, а ты каждый день рискуешь жизнью ради них.", "Впусти меня.", "Ты этого хочешь."]
		doppel_its_all_ok_text = ["Это правильное решение."]
		repeat_answer_english = ["Хочешь увидеть мою настоящую форму?", "Открой дверь, и я покажу её тебе."]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["你有多在意你的邻居？","他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。","让我进去。","你想要那个。"]
		doppel_id_text = ["你有多在意你的邻居？","他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。","让我进去。","你想要那个。"]
		doppel_appearance_text = ["你想看我的真实形态吗？","打开门，我会给你看的。"]
		doppel_dont_show_entry_text = ["文件，文件，还有更多文件。","我可以结束这一切，你只需打开门。"]
		doppel_entry_text = ["你害怕吗？","我能在你睡觉的时候晚上拜访你吗？"]
		doppel_not_today_list_text = ["你想看我的真实形态吗？","打开门，我会给你看的。"]
		doppel_today_list_text = ["你有多在意你的邻居？","他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。","让我进去。","你想要那个。"]
		doppel_its_all_ok_text = ["那是正确的决定。"]
		repeat_answer_english = ["你想看我的真实形态吗？","打开门，我会给你看的。"]

func _on_voice_01_finished() -> void:
	play_random_sfx()

func make_doppelganger() -> void:
	is_doppelganger = true
	var easy_doppel = randi_range(0,1)
	var doppel_random
	if easy_doppel == 0:
		doppel_random = randi_range(0,4)
		if Global.tripo and doppel_random == 3:
			doppel_random = 4
		doppel_number = doppel_random
		match doppel_random:
			0: #frog
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm.","¿Identificación?","No sé que es o lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["Mmmm ¿Mis ojos?","Estoy enferma.","Lo que sea."]
					doppel_dont_show_entry_text = ["Mmmm.","¿Solicitud de entrada?","No sé que es o lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм.","Мое удостоверение?","Я не знаю, что это или вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Мммм. Мои глаза?","Я болею.","Вроде того."]
					doppel_dont_show_entry_text = ["Мммм.","Моё разрешение на вход?","Я не знаю, что это или вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。","身份证？","我不知道那是什么，哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯。我的眼睛？ ","我生病了。","哦无论如何。"]
					doppel_dont_show_entry_text = ["嗯嗯。","我的入境申请？","我不知道那是什么， 哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。我今天的名单上没有，因为我不得不因为紧急情况离开， 哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				eyes_sprite.visible = false
				frog_eyes.visible = true
			1: #zipper
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm.","¿Identificación?","La perdí o lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi cara?","¿Cremallera?","Me operaron de la nariz o lo que sea."]
					doppel_dont_show_entry_text = ["Mmmm.","¿Solicitud de entrada?","La perdí o lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм.","Моё удостоверение?","Я его потеряла или вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Мммм. Моё лицо?","Молния?","Я делала операцию на нос или вроде того."]
					doppel_dont_show_entry_text = ["Мммм.","Моё разрешение на вход?","Я его потеряла или вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。","身份证？","我弄丢了， 哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯。我的脸？","拉链？","我做了鼻子整形手术， 哦无论如何。"]
					doppel_dont_show_entry_text = ["嗯嗯。","我的入境申请？","我弄丢了， 哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				nose_sprite.visible = false
				zipper.visible = true
			2: #no skin
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm.","¿Identificación?","No sé que es o lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi cara?","¿Qué es la piel? o lo que sea."]
					doppel_dont_show_entry_text = ["Mmmm.","¿Solicitud de entrada?","No sé que es o lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм.","Моё удостоверение?","Я не знаю, что это такое или вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Мммм. Моё лицо?","Что такое кожа? Или вроде того."]
					doppel_dont_show_entry_text = ["Мммм.","Моё разрешение на вход?","Я не знаю, что это такое или вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。","身份证？","我弄丢了， 哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯。我的脸？","皮肤是什么？ 哦无论如何。"]
					doppel_dont_show_entry_text = ["嗯嗯。","我的入境申请？","我不知道那是什么， 哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				head.visible = false
				doppel_head.visible = true
			3: #tripo
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm.","¿Identificación?","La perdí o lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["Mmmm ¿Mis ojos?","Estoy enferma.","Lo que sea."]
					doppel_dont_show_entry_text = ["Mmmm.","¿Solicitud de entrada?","La perdí o lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм.","Моё удостоверение?","Я его потеряла или вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Мммм. Мои глаза?","Я болею.","Вроде того."]
					doppel_dont_show_entry_text = ["Мммм.","Моё разрешение на вход?","Я его потеряла или вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。","身份证？","我弄丢了， 哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯。我的眼睛？ ","我生病了。","哦无论如何。"]
					doppel_dont_show_entry_text = ["嗯嗯。","我的入境申请？","我弄丢了， 哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				eyes_sprite.visible = false
				tripo.visible = true
			4: #lot of eyes
				sfx_voice_01 = $Voice_05
				sfx_voice_02 = $Voice_06
				sfx_voice_03 = $Voice_07
				sfx_voice_04 = $Voice_08
				dont_show_entry_request = true
				dont_show_id = true
				eyes_sprite.visible = false
				nose_sprite.visible = false
				mouth.visible = false
				eyebrows.visible = false
				lot_of_eyes.visible = true
				animation_01.play("Moving")
				animation_02.play("Moving")
				animation_03.play("Moving")
				animation_04.play("Moving")
				animation_05.play("Moving")
				animation_06.play("Moving")
				animation_07.play("Moving")
				animation_08.play("Moving")
				animation_09.play("Moving")
				hello_text_english = ["..... ..."]
				hello_text_spanish = ["..... ..."]
				hello_text_chinese = ["..... ..."]
				doppel_dont_show_id_text = ["..... ... ..... ..."]
				doppel_id_text = ["..... ... ..... ..."]
				doppel_appearance_text = ["..... ... ..... ..."]
				doppel_dont_show_id_text = ["..... ... ..... ..."]
				doppel_entry_text = ["..... ... ..... ..."]
				doppel_dont_show_entry_text = ["..... ... ..... ..."]
				doppel_not_today_list_text = ["..... ... ..... ..."]
				doppel_today_list_text = ["..... ... ..... ..."]
				doppel_its_all_ok_text = ["..... ... ..... ..."]
				repeat_answer_english = ["..... ... ..... ..."]
				repeat_answer_spanish = ["..... ... ..... ..."]
	else:
		doppel_random = randi_range(5,8)
		doppel_number = doppel_random
		match doppel_random:
			5: #all ok
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Olvidé mostrar mi identificación.","Lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está.","Lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм. Я забыла показать своё удостоверение.","Вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Мммм. Я забыла показать своё разрешение на вход, вот оно.","Вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。","哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请，请看这里。","哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				var random = randi_range(0,5) 
				match random:
					0: # ID
						random = randi_range(0,2)
						match random:
							0:
								number_id = FAKE_ID_01
							1:
								number_id = FAKE_ID_02
							2:
								number_id = FAKE_ID_03
					1: # Name
						random = randi_range(0,2)
						match random:
							0:
								name_char = FAKE_NAME_01
							1:
								name_char = FAKE_NAME_02
							2:
								name_char = FAKE_NAME_03
					2: # Last name
						random = randi_range(0,2)
						match random:
							0:
								last_name_char = FAKE_LAST_NAME_01
							1:
								last_name_char = FAKE_LAST_NAME_02
							2:
								last_name_char = FAKE_LAST_NAME_03
					3: # Expiration
						random = randi_range(0,2)
						match random:
							0:
								id_exp_date = FAKE_DATE_01
							1:
								id_exp_date = FAKE_DATE_02
							2:
								id_exp_date = FAKE_DATE_03
					4: # Apartment
						random = randi_range(0,2)
						match random:
							0:
								apart_number_english = FAKE_APARTMENT_ENGLISH_01
								apart_number_spanish = FAKE_APARTMENT_SPANISH_01
							1:
								apart_number_english = FAKE_APARTMENT_ENGLISH_02
								apart_number_spanish = FAKE_APARTMENT_SPANISH_02
							2:
								apart_number_english = FAKE_APARTMENT_ENGLISH_03
								apart_number_spanish = FAKE_APARTMENT_SPANISH_03
					5: # Entry request
						random = randi_range(0,2)
						match random:
							0:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SECOND_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SECOND_CHINESE
							1:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_CHINESE
							2:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
			6: #nose
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Olvidé mostrar mi identificación.","Lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está.","Lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм. Я забыла показать своё удостоверение.","Вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Мммм. Я забыла показать своё разрешение на вход, вот оно.","Вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。","哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请，请看这里。","哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				nose_sprite.visible = false
				doppel_nose.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
			7: #no date
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Olvidé mostrar mi identificación.","Lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está.","Lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм. Я забыла показать своё удостоверение.","Вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Мммм. Я забыла показать моё разрешение на вход, вот он.","Вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в списке на сегодня, потому что мне пришлось уйти из-за срочной ситуации или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。","哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请，请看这里。","哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				get_parent().get_parent().hide_date_id(false)
			8: #no ddd
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Olvidé mostrar mi identificación.","Lo que sea."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está.","Lo que sea."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm ¿Puede abrirme la puerta?","O lo que sea."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Мммм. Я забыла показать своё удостоверение.","Вроде того."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Мммм. Я забыла показать моё разрешение на вход, вот он.","Вроде того."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Мммм. Меня нет в сегодняшнем списке, потому что мне пришлось срочно уйти или вроде того."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Мммм. Можешь открыть мне дверь?","Или вроде того."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。","哦无论如何。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请，请看这里。","哦无论如何。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。 我今天的名单上没有，因为我不得不因为紧急情况离开，哦无论如何。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["嗯嗯。你能帮我开门吗？","哦无论如何。"]
				get_parent().get_parent().hide_ddd_logo_entry(false)

func _record_update() -> void:
	get_parent().get_parent().hide_ddd_logo_entry(true)
	get_parent().get_parent().hide_date_id(true)
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else:
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Анастача Микаелис"
	else:
		if !"Anastacha_Mikaelys" in Global.char_at_home_list:
			Global.char_at_home_list.append("Anastacha_Mikaelys")
			Global.char_out_home_list.erase("Anastacha_Mikaelys")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Анастача: "
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos de sapo"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Глаза лягушки"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "青蛙的眼睛"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cremallera"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Застёжка"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "拉链"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin piel"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Нет кожи"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有皮肤"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Agujeros"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Дырки"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "孔洞"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Muchos ojos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Много глаз"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "许多眼睛"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Поддельные документы"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Неправильный нос"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin fecha en id"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Нет даты на удостоверении"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "身份证上没有日期"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Нет логотипа D.D.D."
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
