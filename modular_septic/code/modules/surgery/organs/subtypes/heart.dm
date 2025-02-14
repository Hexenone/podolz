/obj/item/organ/heart
	name = "Heart"
	desc = "Follow."
	icon_state = "heart"
	zone = BODY_ZONE_CHEST
	organ_efficiency = list(ORGAN_SLOT_HEART = 100)
	w_class = WEIGHT_CLASS_SMALL

	low_threshold_passed = span_info("Tingling pain appears and fades in the chest...")
	high_threshold_passed = span_warning("Something inside my chest hurts, and the pain does not subside. I feel myself much faster than before.")
	now_fixed = span_info("My heart is beating again.")
	high_threshold_cleared = span_info("Chest pain subsided and I became more relaxed.")

	attack_verb_continuous = list("beats", "thumps")
	attack_verb_simple = list("beat", "thump")

	// the volume shouldn't worry you, the chest is full of organs - also getting shot in the heart sucks
	organ_volume = 0.5
	max_blood_storage = 100
	current_blood = 100
	blood_req = 10
	oxygen_req = 5
	nutriment_req = 5
	hydration_req = 5

	/// Have we been bypassed to avoid nasty blockages?
	var/open = FALSE
	/// If we're not beating that is not a good sign
	var/beating = TRUE
	///convulsion sounds
	var/convulsion_sound = list('modular_septic/sound/emotes/convulse1.ogg', 'modular_septic/sound/emotes/convulse2.ogg')

/obj/item/organ/heart/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(stop_if_unowned)), 8 SECONDS)

/obj/item/organ/heart/on_life(delta_time, times_fired)
	. = ..()
	if(!failed && is_failing() && owner.needs_heart()) // heart broke, stopped beating, death imminent...
		if(owner.stat == CONSCIOUS)
			owner.visible_message(span_danger("<b>[owner]</b> curls up towards his [parse_zone(BODY_ZONE_CHEST)]!"))
		playsound(owner, convulsion_sound, 95, FALSE)
		owner.sound_hint()
		failed = TRUE

/obj/item/organ/heart/is_working()
	if(owner)
		return (..() && beating)
	return ..()

/obj/item/organ/heart/is_failing()
	if(owner)
		return (..() || !beating)
	return ..()

/obj/item/organ/heart/Remove(mob/living/carbon/old_owner, special = FALSE)
	. = ..()
	if(!special)
		addtimer(CALLBACK(src, PROC_REF(stop_if_unowned)), 12 SECONDS)

/obj/item/organ/heart/attack_self(mob/user)
	. = ..()
	if(!beating)
		user.visible_message(span_notice("[user] presses on [src] to make it beat again!"), \
					span_notice("I press on [src] to make it beat again."))
		Restart()
		addtimer(CALLBACK(src, PROC_REF(stop_if_unowned)), 8 SECONDS)

/obj/item/organ/heart/proc/can_stop()
	if(beating)
		return TRUE
	return FALSE

/obj/item/organ/heart/proc/stop_if_unowned()
	if(!owner)
		Stop()

/obj/item/organ/heart/proc/Stop()
	var/old_beating = beating
	beating = FALSE
	update_appearance()
	if(owner && old_beating)
		var/deathsdoor = TRUE
		for(var/thing in (owner.getorganslotlist(ORGAN_SLOT_HEART) - src))
			var/obj/item/organ/heart/heart = thing
			if(heart.beating)
				deathsdoor = FALSE
		if(deathsdoor)
			to_chat(owner, span_flashinguserdanger("Everything fades!"))
	return TRUE

/obj/item/organ/heart/proc/Restart()
	var/old_beating = beating
	beating = TRUE
	update_appearance()
	if(owner && !old_beating)
		to_chat(owner, span_userdanger("My [name] beats again!"))
	return TRUE

/obj/item/organ/heart/on_eat_from(eater, feeder)
	. = ..()
	Stop()

/obj/item/organ/heart/get_availability(datum/species/S)
	return (!(NOBLOOD in S.species_traits) && !(TRAIT_STABLEHEART in S.inherent_traits))

/obj/item/organ/heart/halber
	maxHealth = 120
	high_threshold = 110
	low_threshold = 100
