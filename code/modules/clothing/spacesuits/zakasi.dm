
// Zakasi space gear (vaccuum suit, low pressure armour)
// Can't be equipped by any other species due to size and alien anatomy.
/obj/item/clothing/suit/space/zakasi
	w_class = ITEM_SIZE_NORMAL
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/melee/energy/sword,/obj/item/weapon/handcuffs,/obj/item/weapon/tank)
	armor = list(melee = 60, bullet = 50, laser = 40,energy = 15, bomb = 30, bio = 30, rad = 30)
	siemens_coefficient = 0.6
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/suit/space/zakasi/New()
	..()
	slowdown_per_slot[slot_wear_suit] = 2

/obj/item/clothing/head/helmet/space/zakasi
	armor = list(melee = 60, bullet = 50, laser = 40, energy = 15, bomb = 30, bio = 30, rad = 30)
	siemens_coefficient = 0.6
	item_flags = STOPPRESSUREDAMAGE
	flags_inv = 0
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/head/helmet/space/zakasi/pressure
	name = "alien helmet"
	icon_state = "zakasi-pressure"
	desc = "Zakasi Pressurized Helmet"

/obj/item/clothing/suit/space/zakasi/pressure
	name = "alien pressure suit"
	icon_state = "zakasi-pressure"
	desc = "A pressurized suit reinforced with heavy steel plates commonly used by zakasi pirates."

/obj/item/clothing/head/helmet/space/zakasi/carapace
	name = "zakasi carapace helmet"
	icon_state = "zakasi-carapace"
	desc = "Zakasi Skull Carapace."

/obj/item/clothing/suit/space/zakasi/carapace
	name = "zakasi carapace armour"
	icon_state = "zakasi-carapace"
	desc = "An armoured, segmented carapace with glowing purple lights. It looks pretty run-down."

/obj/item/clothing/head/helmet/space/zakasi/stealth
	name = "zakasi stealth helmet"
	icon_state = "zakasi-stealth"
	desc = "The Notorious Helmets of Zakasi Infiltrators."

/obj/item/clothing/suit/space/zakasi/stealth
	name = "zakasi stealth suit"
	icon_state = "zakasi-stealth"
	desc = "The distinctive black armor of zakasi infiltrators."

/obj/item/clothing/head/helmet/space/zakasi/medic
	name = "zakasi surgeon's helmet"
	icon_state = "zakasi-medic"
	desc = "Bizarre helmet worn by sightless zakasi surgeons."

/obj/item/clothing/suit/space/zakasi/medic
	name = "zakasi surgeon's armour"
	icon_state = "zakasi-medic"
	desc = "A menacing pressurized suit worn by zakasi surgeons."

/obj/item/clothing/gloves/zakasi
	desc = "Gauntlets typically worn by Engineers aboard Zakasi Vessels"
	name = "insulated gauntlets"
	icon_state = "gloves-zakasi"
	item_state = "gloves-zakasi"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	species_restricted = list(SPECIES_ZAKASI)

/obj/item/clothing/shoes/magboots/zakasi
	desc = "A pair of heavily armoured Zakasi mag-claws."
	name = "zakasi magclaws"
	item_state = "boots-zakasi"
	icon_state = "boots-zakasi"
	species_restricted = list(SPECIES_ZAKASI)
	action_button_name = "Toggle the magclaws"

/obj/item/clothing/shoes/magboots/zakasi/attack_self(mob/user)
	if(src.magpulse)
		item_flags &= ~NOSLIP
		magpulse = 0
		canremove = 1
		to_chat(user, "You relax your deathgrip on the flooring.")
	else
		//make sure these can only be used when equipped.
		if(!ishuman(user))
			return
		var/mob/living/carbon/human/H = user
		if (H.shoes != src)
			to_chat(user, "You will have to put on the [src] before you can do that.")
			return

		item_flags |= NOSLIP
		magpulse = 1
		canremove = 0	//kinda hard to take off magclaws when you are gripping them tightly.
		to_chat(user, "You dig your claws deeply into the flooring, bracing yourself.")
		to_chat(user, "It would be hard to take off the [src] without relaxing your grip first.")
	user.update_action_buttons()

//In case they somehow come off while enabled.
/obj/item/clothing/shoes/magboots/zakasi/dropped(mob/user as mob)
	..()
	if(src.magpulse)
		user.visible_message("The [src] go limp as they are removed from [usr]'s feet.", "The [src] go limp as they are removed from your feet.")
		item_flags &= ~NOSLIP
		magpulse = 0
		canremove = 1

/obj/item/clothing/shoes/magboots/zakasi/examine(mob/user)
	. = ..(user)
	if (magpulse)
		to_chat(user, "It would be hard to take these off without relaxing your grip first.")//theoretically this message should only be seen by the wearer when the claws are equipped.



//UNDER CLOTHING
/obj/item/clothing/under/serviceoveralls/zakasi
	name = "zakasi standard underlay"
	desc = "a thin cloth underlay intended to be worn under a suit."
	icon_state = "standard"
	species_restricted = list(SPECIES_ZAKASI)
	item_state = "lb_suit"
	worn_state = "mechanic"

/obj/item/clothing/under/sterile/zakasi
	name = "zakasi sterile underlay"
	desc = "A sheath of sterile cloth to be worn under a suit. Protects against all manner of biohazards."
	icon_state = "sterile"
	species_restricted = list(SPECIES_ZAKASI)
	item_state = "w_suit"
	worn_state = "sterile"
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 30, rad = 0)

/obj/item/clothing/under/hazard/zakasi
	name = "zakasi engineering underlay"
	desc = "A resilient underlay made from heat and radiation resistant materials."
	icon_state = "hazard"
	species_restricted = list(SPECIES_ZAKASI)
	item_state = "engi_suit"
	worn_state = "hazard"
	siemens_coefficient = 0.8
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 20, bio = 0, rad = 20)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE