//Sounding rod
/datum/mood_event/sounding_ua
	description = span_nicegreen("УУУУУУУУУААА")
	mood_change = 6
	timeout = 10 SECONDS

/datum/mood_event/sounding_au
	description = span_nicegreen("АУУУУУУУУУУУУУ")
	mood_change = 6
	timeout = 10 SECONDS

//Devious licked
/datum/mood_event/devious_lick
	description = span_achievementgood("Я стану популярным в тиктоке!")
	mood_change = 6
	timeout = 5 MINUTES

//I LOVE LEAAAANNNNNN!!!
/datum/mood_event/lean
	description = span_purple("А мне нравится морсян.")
	mood_change = 4
	timeout = 3 MINUTES

/datum/mood_event/lean/add_effects(mob/living/lean_monster)
	var/list/messages = list("Тупо чангус", "Да я тупо чангус!", "Тупо тупо чангус чангус", "Морсик хорош")
	if((lean_monster.job == "Ordinator") || (lean_monster.job == "Coordinator") || (lean_monster.job == "Mayor" ))
		messages += "Let's fuck up some beggers, let's do that shit random"
	else
		messages += "Надо бы просто разъебать всех, ХОРОШАЯ ЖЕ ИДЕЯ!"
	description = span_purple(pick(messages))

//Buried/cremated someone
/datum/mood_event/proper_burial
	description = span_nicegreen("Нормально похоронили.")
	mood_change = 2
	timeout = 15 MINUTES

//Tricky moodlet
/datum/mood_event/tricky
	description = span_colossus("Я проклял себя на жизнь, полную фрагов.")
	mood_change = 4
	timeout = 5 MINUTES

/datum/mood_event/tricky/add_effects(mob/living/madman)
	var/list/tricky_messages = list("WHO WANTS TO F'F'F'F'FIGHT ME'E'E?", "YOU ARE D'D'D'DEAD STU'UPID!", "WHO WANTS TO F'F'F'FIGHT M'ME'E'E'E", "MUAHHAHAHAHAHAHAH!", "WHERE IS H'H'HE?!", "MAUHAHAHAHAHAHA!", "YOU ARE D'D'DEAD STUPID!", "MUHAHAAHAHA!!")
	description = span_colossus(pick(tricky_messages))

//Masochist mood
/datum/mood_event/paingood
	description = span_nicegreen("Боль очищает разум и душу.")
	mood_change = 4
	timeout = 2 MINUTES

//Antag mood nerf
/datum/mood_event/focused
	description = span_nicegreen("Есть поставленная задача!")
	mood_change = 2
	hidden = TRUE

//Cum on face
/datum/mood_event/creampie/bukkake
	description = span_nicegreen("Моё лицо <b>разъёбанно</b> в сперме!")
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/creampie/cummies
	description = span_nicegreen("Моё лицо покрыто спермой.")
	mood_change = 2
	timeout = 3 MINUTES

//Femcum on face
/datum/mood_event/creampie/fembukkake
	description = span_nicegreen("Моё лицо <b>разъёбанно</b> в сперме!")
	mood_change = 3
	timeout = 5 MINUTES

/datum/mood_event/creampie/femcummies
	description = span_nicegreen("Моё лицо покрыто спермой.")
	mood_change = 2
	timeout = 3 MINUTES

/datum/mood_event/belief/hadot
	description = span_nicegreen("Теперь я служу Хадоту!")
	mood_change = 2
	timeout = 10 MINUTES

/datum/mood_event/belief/gutted
	description = span_nicegreen("Теперь я служу Гаттеду!")
	mood_change = 2
	timeout = 10 MINUTES

/datum/mood_event/koatik
	description = span_nicegreen("Странная энергия!")
	mood_change = 10
	timeout = 10 MINUTES