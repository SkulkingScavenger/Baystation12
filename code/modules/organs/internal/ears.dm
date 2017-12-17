
/obj/item/organ/internal/ears
	name = "ears"
	icon_state = "ears"
	gender = PLURAL
	organ_tag = BP_EARS
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	max_damage = 45

// /obj/item/organ/internal/ears/optics
// 	robotic = ORGAN_ROBOT
// 	organ_tag = BP_SONAR

// /obj/item/organ/internal/ears/optics/New()
// 	..()
// 	robotize()

// /obj/item/organ/internal/ears/robotize()
// 	..()
// 	name = "sonar receiver"
// 	icon = 'icons/obj/robot_component.dmi'
// 	icon_state = "sonar receiver"
// 	dead_icon = "sonar_broken"

// /obj/item/organ/internal/ears/robot
// 	name = "sonar receiver"

// /obj/item/organ/internal/ears/robot/New()
// 	..()
// 	robotize()


/obj/item/organ/internal/eyes/take_damage(amount, var/silent=0)
	var/oldbroken = is_broken()
	. = ..()
	if(is_broken() && !oldbroken && owner && !owner.stat)
		to_chat(owner, "<span class='danger'>You go deaf!</span>")

/obj/item/organ/internal/ears/Process()
	..()
	if(!owner)
		return
	if(is_bruised())
		owner.eye_blurry = 20
	if(is_broken())
		owner.eye_blind = 20
