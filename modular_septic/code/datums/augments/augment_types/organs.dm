/datum/augment_item/organ
	category = AUGMENT_CATEGORY_ORGANS

/datum/augment_item/organ/missing

/datum/augment_item/organ/missing/apply_to_human(mob/living/carbon/human/human, character_setup = FALSE, datum/preferences/prefs)
	if(character_setup)
		return
	var/list/kill_organs = human.getorganlist(path)
	for(var/obj/item/organ/organ in kill_organs)
		organ.Remove(human, FALSE)
		qdel(organ)

//HEART
/datum/augment_item/organ/heart
	slot = AUGMENT_SLOT_HEART

/datum/augment_item/organ/heart/robotic
	name = "Cybernetic Heart 1.0"
	description = "An electronic device designed to mimic the functions of an organic human heart."
	path = /obj/item/organ/heart/cybernetic
	value = 3

/datum/augment_item/organ/heart/robotic/two
	name = "Cybernetic Heart 2.0"
	description = "An electronic device designed to mimic the functions of an organic human heart. Also holds an emergency dose of epinephrine, used automatically after facing severe trauma."
	path = /obj/item/organ/heart/cybernetic/tier2
	value = 4

//LUNGS
/datum/augment_item/organ/lungs
	slot = AUGMENT_SLOT_LUNGS

/datum/augment_item/organ/lungs/robotic
	name = "Cybernetic Lungs 1.0"
	description = "A basic cybernetic version of the lungs found in traditional humanoid entities."
	path = /obj/item/organ/lungs/cybernetic
	value = 3

/datum/augment_item/organ/lungs/robotic/two
	name = "Cybernetic Lungs 2.0"
	description = "A cybernetic version of the lung found in traditional humanoid entities. Allows for greater intakes of oxygen than organic lungs, requiring slightly less pressure."
	path = /obj/item/organ/lungs/cybernetic/tier2
	value = 4