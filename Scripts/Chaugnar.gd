extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100,270)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(990,270)
const CHAR_AT_DELETE_POS = Vector2(1900,270)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_footsteps = $Footsteps
@onready var sfx_voice_01 = $Voice_05
@onready var sfx_voice_02 = $Voice_06
@onready var sfx_voice_03 = $Voice_07
@onready var sfx_voice_04 = $Voice_08
@onready var horns = $Head/Horns
@onready var trunk = $Head/Trunk
@onready var eyes = $Head/Eyes
@onready var eyes_doppel = $Head/Eyes_doppel
@onready var eyes_doppel_2 = $Head/Eyes_doppel2
@onready var tattoo = $Head/Tattoo
@onready var tattoo_doppel_01 = $Head/Tattoo_doppel01
@onready var tattoo_doppel_02 = $Head/Tattoo_doppel02
@onready var mole = $Head/Mole
@onready var trunk_animation = $Trunk

var current_text = []
var is_doppelganger = false
var checklist_values = []
var id_photo
var entry_photo
var speak_flag = true
var name_char = "God"
var last_name_char
var number_id
var id_exp_date
var entry_request_reason
var hello_text
var id_text
var id_not_show_text
var entry_text
var entry_not_show_text
var appearance_text
var today_list_text
var not_today_list_text
var exit_text
var repeat_question
var apart_number
var dont_show_id = false
var dont_show_entry_request = false
var doppel_number
var name_alter = "Arnold_Schmicht"

func _ready() -> void:
	randomize()
	set_sfx_volume()
	chaugnar()
	if randi_range(0,5) == 0:
		dont_show_id = true
	if randi_range(0,5) == 0:
		dont_show_entry_request = true
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

func chaugnar() -> void:
	id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo.png")
	entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo.png")
	name_char = "Чаугнар"
	last_name_char = "Фаугн"
	number_id = "456989632368"
	id_exp_date = "01/1971"
	if Global.language == SPANISH_VALUE:
		apart_number = "P02-01"
		if randi_range(0,1) == 0:
			entry_request_reason = "Soy residente de este círculo astral, salí a realizar ocultismos."
		else:
			entry_request_reason = "Soy residente de este círculo astral, mi apartamento es el 01 del segundo piso."
		hello_text = ["Saludos, humano."]
		id_text = ["Acaso no ves que mi identificación está perfecta."]
		id_not_show_text = ["Aquí está mi identificación."]  
		entry_text = ["Mi solicitud está perfecta."]
		entry_not_show_text = ["Aquí está mi solicitud de entrada."]
		appearance_text = ["¿Mi apariencia? Tal vez tus ojos mortales no puedan procesar mi presencia."]
		today_list_text = ["Sabes muy bien que estoy en la lista."]
		if randi_range(0,1) == 0:
			not_today_list_text = ["No estoy en la lista porque tuve que realizar un ocultismo de emergencia."]
		else:
			not_today_list_text = ["Debe haber un error porque sí debería estar en la lista."]
		exit_text = ["Ya era hora."]
		repeat_question = ["Ya respondí tu pregunta, humano."]
	elif Global.language == ENGLISH_VALUE:
		apart_number = "F02-01"
		if randi_range(0,1) == 0:
			entry_request_reason = "Я житель этого астрального круга, я вышел, чтобы провести оккультные ритуалы."
		else:
			entry_request_reason = "Я житель этого астрального круга, моя квартира 01 на втором этаже."
		hello_text = ["Приветствую, человек."]
		id_text = ["Разве ты не видишь, что моё удостоверение идеально?"]
		id_not_show_text = ["Вот моё удостоверение."]
		entry_text = ["Моё разрешение на вход идеальное."]
		entry_not_show_text = ["Вот моё рзрешение на вход."]
		appearance_text = ["Мой внешний вид? Возможно, твои смертные глаза не могут постигнуть моё присутствие."]
		today_list_text = ["Ты знаешь, что я в списке."]
		if randi_range(0,1) == 0:
			not_today_list_text = ["Меня нет в списке, потому что мне пришлось провести экстренный оккультный ритуал."]
		else:
			not_today_list_text = ["Должна быть ошибка, потому что я должен быть в списке."]
		exit_text = ["Наконец-то."]
		repeat_question = ["Я уже ответил на этот вопрос, человек."]
	else:
		apart_number = "F02-01"
		if randi_range(0,1) == 0:
			entry_request_reason = "我是这个星界圈的居民，我出去进行神秘活动。"
		else:
			entry_request_reason = "我是这个星界圈的居民，我的公寓在二楼的01号。"
		hello_text = ["问候，人类。"]
		id_text = ["难道你没看到我的身份证明很完美吗？"]
		id_not_show_text = ["这是我的身份证。"]  
		entry_text = ["这是你的第一天吗，人类？我的请求是完美的。"]
		entry_not_show_text = ["这是我的入境申请。"]
		appearance_text = ["我的外貌？也许你那凡人的眼睛无法理解我的存在。"]
		today_list_text = ["不要浪费我的时间，人类。你知道我在名单上。"]
		if randi_range(0,1) == 0:
			not_today_list_text = ["我不在名单上，因为我不得不进行紧急神秘仪式。"]
		else:
			not_today_list_text = ["一定是出了错，因为我应该在名单上。"]
		exit_text = ["最后。"]
		repeat_question = ["我已经回答了你的问题，人类。"]

func make_doppelganger() -> void:
	is_doppelganger = true
	doppel_number = randi_range(0,7)
	var random
	match doppel_number:
		0: #Name/Lastname
			random = randi_range(0,3)
			match random:
				0:
					name_char = "Чагунар"
				1:
					last_name_char = "Фаунгн"
				2:
					name_char = "Чаугмар"
				_:
					last_name_char = "Фавгн"
		1: #ID
			random = randi_range(0,3)
			match random:
				0:
					number_id = "456989636368"
				1:
					number_id = "456989362368"
				2:
					number_id = "459689632368"
				_:
					number_id = "456986932368"
		2: #Eyes
			eyes.visible = false
			random = randi_range(0,1)
			match random:
				0:
					eyes_doppel.visible = true
					id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_03.png")
					entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_03.png")
				_:
					eyes_doppel_2.visible = true
					id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_03.png")
					entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_03.png")
		3: #Horns
			horns.visible = true
			id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_01.png")
			entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_01.png")
		4: #Trunk
			random = randi_range(0,1)
			match random:
				0:
					trunk.play("DOPPEL_01")
					id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_02.png")
					entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_02.png")
				_:
					trunk.play("DOPPEL_02")
		5: # Tatoo
			tattoo.visible = false
			random = randi_range(0,1)
			match random:
				0:
					tattoo_doppel_01.visible = true
					id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_05.png")
					entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_05.png")
				_:
					tattoo_doppel_02.visible = true
					id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_06.png")
					entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_06.png")
		6: # Mole
			mole.visible = true
			id_photo = load("res://Assets/Graphics/Char_Chaugnar_Small_Photo_doppel_07.png")
			entry_photo = load("res://Assets/Graphics/Char_Chaugnar_Long_Photo_doppel_07.png")
		_: # DDD logo
			get_parent().get_parent().change_ddd_logo(randi_range(0,2),randi_range(0,1))

func _first_words() -> void:
	speak_flag = false
	if !dont_show_id:
		get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
	if !dont_show_entry_request:
		get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number,entry_request_reason,entry_photo)
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func change_current_text(n:int) -> void:
	match n:
		0:
			current_text = hello_text
		1:
			if Global.is_id_wrong_answer:
				current_text = repeat_question
			else:
				if dont_show_id:
					dont_show_id = false
					current_text += id_not_show_text
					get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
				else:
					current_text += id_text
			Global.is_id_wrong_answer = true
		2:
			if Global.is_appearance_wrong_answer:
				current_text = repeat_question
			else:
				current_text += appearance_text
			Global.is_appearance_wrong_answer = true
		3:
			if Global.is_entry_request_wrong_answer:
				current_text = repeat_question
			else:
				if dont_show_entry_request:
					dont_show_entry_request = false
					current_text += entry_not_show_text
					get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number,entry_request_reason,entry_photo)
				else:
					current_text += entry_text
			Global.is_entry_request_wrong_answer = true
		4:
			if Global.is_today_list_wrong_answer:
				current_text = repeat_question
			else:
				current_text += today_list_text
			Global.is_today_list_wrong_answer = true
		5:
			current_text = exit_text
		-1:
			current_text = repeat_question
		_:
			current_text = []

func set_sfx_volume() -> void:
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func talk() -> void:
	talking.play("TALK")
	trunk_animation.play("TALK")

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
		trunk_animation.stop()

func _on_voice_finished() -> void:
	play_random_sfx()

func _record_update() -> void:
	get_parent().get_parent().restart_ddd_logo()
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else:
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Чаугнар"
			get_parent().get_parent().set_entity(true)
	else:
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Чаугнар: "
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nombre falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Неверное имя"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的名字"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Número de id falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Неверный номер удостоверения"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的身份证号码"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Неправильные глаза"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cuernos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Фальшивые рога"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "假角"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Trompa falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Фальшивый хобот"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "假象鼻"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Tatuaje falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Неправильное тату"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的纹身"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Родинка"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
				_:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Поддельный логотип DDD"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
			get_parent().get_parent().set_game_over(true)
		else:
			if !"Arnold_Schmicht" in Global.char_at_home_list:
				Global.char_at_home_list.append("Arnold_Schmicht")
				Global.char_out_home_list.erase("Arnold_Schmicht")

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
