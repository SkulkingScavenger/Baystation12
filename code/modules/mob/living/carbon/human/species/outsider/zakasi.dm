/datum/species/zakasi
	name = SPECIES_ZAKASI
	name_plural = SPECIES_ZAKASI
	icobase = 'icons/mob/human_races/r_zakasi.dmi'
	deform = 'icons/mob/human_races/r_def_zakasi.dmi'
	default_language = "Zakasi"
	language = LANGUAGE_ZAKASI
	num_alternate_languages = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,  /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/strong)
	rarity_value = 1
	blurb = "The Zakasi are a race of greedy, lazy and opportunistic scavengers native to the corpse world Zakaas. \
		While cunning and technically advanced, they are best known as thieves and smugglers. Their far-wandering pirate \
		vessels prowl along the edges of civilized space where they prey upon derelict ships and isolated outposts. \
		Their skin is pale and rubbery, covered intermittently with drab, mangy fur. They have long tails which are \
		mostly hairless. They have powerful, oversized jaws that allow them to swallow smaller prey whole. They have \
		no eyes. Their primary senses are sound, scent, and an organic radar system using their large ears as receivers, \
		and a specialized transmitter housed in the skull. Although widely regarded as a menace and universally distrusted,\
		it is not uncommon for less scrupulous civilizations to have dealings with them."

	

	speech_sounds = list('sound/voice/shriek1.ogg')
	speech_chance = 20

	warning_low_pressure = 50
	hazard_low_pressure = 0

	cold_level_1 = 80
	cold_level_2 = 50
	cold_level_3 = 0

	hunger_factor = LARGE_HUNGER_FACTOR
	taste_sensitivity = TASTE_NUMB

	gluttonous = GLUT_SMALLER | GLUT_ITEM_NORMAL | GLUT_PROJECTILE_VOMIT
	stomach_capacity = MOB_MEDIUM

	breath_type = "oxygen"
	poison_type = "phoron"
	exhale_type = "carbon_dioxide"
	siemens_coefficient = 0.2

	flags = NO_SCAN 
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_SKIN_COLOR

	blood_color = "#333333"
	flesh_color = "#888888"

	reagent_tag = IS_ZAKASI

	inherent_verbs = list(
		/mob/living/carbon/human/proc/leap
		)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)


	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EARS =   /obj/item/organ/internal/ears,
		BP_STACK =    /obj/item/organ/internal/stack
		)

	vision_organ = BP_EARS

	genders = list(MALE,FEMALE)

/datum/species/zakasi/get_random_name(var/gender)
	var/datum/language/species_language = all_languages[default_language]
	return species_language.get_random_name(gender)

/datum/species/vox/equip_survival_gear(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/breath(H), slot_wear_mask)

	if(istype(H.get_equipped_item(slot_back), /obj/item/weapon/storage/backpack))
		H.equip_to_slot_or_del(new /obj/item/weapon/tank/nitrogen(H), slot_r_hand)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H.back), slot_in_backpack)
		H.internal = H.r_hand
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/tank/nitrogen(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/vox(H), slot_r_hand)
		H.internal = H.back

	if(H.internals)
		H.internals.icon_state = "internal1"

/datum/species/vox/disfigure_msg(var/mob/living/carbon/human/H)
	var/datum/gender/T = gender_datums[H.get_gender()]
	return "<span class='danger'>[T.His] nameplate is mangled! [T.He] [T.is] impossible to identify.</span>\n"