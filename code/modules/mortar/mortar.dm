

/obj/structure/mortar
	name = "Mortar"
	desc = "Mortar"
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_m402"
	anchored = 1
	density = 1
	var/xinput
	var/yinput
	var/xdial
	var/ydial
	var/xoffset = 0
	var/yoffset = 0
	var/offset_per_turfs = 10 //Number of turfs to offset from target by 1
	var/firing = 0
	var/busy = 0
	var/fixed = 0 //If 1, mortar cannot be unarchored and moved.
	var/travel_time = 45
	var/max_shells = 1
	var/list/shells = new/list


/obj/structure/mortar/attack_hand(mob/user as mob)
	if(busy)
		user << "<span class='warning'>Someone else is currently using [src].</span>"
		return
	if(firing)
		user << "<span class='warning'>[src]'s barrel is still steaming hot. Wait a few seconds and stop firing it.</span>"
		return
	add_fingerprint(user)

	var/choice = alert(user, "Would you like to set the mortar's target coordinates?","Mortar Dialing", "Target","Dial" , "Cancel")
	if (choice == "Cancel")
		return
	if(choice == "Target")
		xinput = input("Set longitude of strike from 0 to [world.maxx].")as num
		yinput = input("Set latitude of strike from 0 to [world.maxx].")as num
		return
		if(busy)
			user << "<span class='warning'>Someone else is currently using this mortar.</span>"
			return
		user.visible_message("<span class='notice'>[user] starts adjusting [src]'s firing angle and distance.</span>", //These messages dont pop up for some reason, also timer isnt working on this one
		"<span class='notice'>You start adjusting [src]'s firing angle and distance to match the new coordinates.</span>")
		busy = 1
		if(do_after(user, 30, src))
			user.visible_message("<span class='notice'>[user] finishes adjusting [src]'s firing angle and distance.</span>",
			"<span class='notice'>You finish adjusting [src]'s firing angle and distance to match the new coordinates.</span>")
			busy = 0
		else
			busy = 0

	if(choice == "Dial")
		var/temp_dial_x = input("Set longitude adjustement from -10 to 10.") as num
		if(temp_dial_x + xinput > world.maxx || temp_dial_x + xinput < 0)
			user << "<span class='warning'>You cannot dial to this coordinate, it is outside of the area of operations.</span>"
			return
		if(temp_dial_x < -10 || temp_dial_x > 10)
			user << "<span class='warning'>You cannot dial to this coordinate, it is too far away. You need to set [src] up instead.</span>"
			return
		var/temp_dial_y = input("Set latitude adjustement from -10 to 10.") as num
		if(temp_dial_y + yinput > world.maxy || temp_dial_y + yinput < 0)
			user << "<span class='warning'>You cannot dial to this coordinate, it is outside of the area of operations.</span>"
			return
		var/turf/T = locate(xinput + temp_dial_x, yinput + temp_dial_y, z)
		if(get_dist(loc, T) < 10)
			user << "<span class='warning'>You cannot dial to this coordinate, it is too close to your mortar.</span>"
			return
		if(temp_dial_y < -10 || temp_dial_y > 10)
			user << "<span class='warning'>You cannot dial to this coordinate, it is too far away. You need to set [src] up instead.</span>"
			return
		if(busy)
			user << "<span class='warning'>Someone else is currently using this mortar.</span>"
			return
		user.visible_message("<span class='notice'>[user] starts dialing [src]'s firing angle and distance.</span>",
		"<span class='notice'>You start dialing [src]'s firing angle and distance to match the new coordinates.</span>")
		busy = 1
		if(do_after(user, 15, src))
			user.visible_message("<span class='notice'>[user] finishes dialing [src]'s firing angle and distance.</span>",
			"<span class='notice'>You finish dialing [src]'s firing angle and distance to match the new coordinates.</span>")
			busy = 0
			xdial = temp_dial_x
			ydial = temp_dial_y
		else
			busy = 0



obj/structure/mortar/attackby(var/obj/item/O as obj, mob/user as mob)

	if(istype(O, /obj/item/mortar_shell))

		var/obj/item/mortar_shell/mortar_shell = O
		if(busy)
			user << "<span class='warning'>Someone else is currently using [src].</span>"
			return
		if(z != 1)
			user << "<span class='warning'>You cannot fire [src] here.</span>"
			return
		if(xinput == 0 && yinput == 0) //Mortar wasn't set
			user << "<span class='warning'>[src] needs to be aimed first.</span>"
			return
		var/turf/T = locate(xinput + xdial + xoffset, yinput + ydial + yoffset, z)
		if(!isturf(T))
			user << "<span class='warning'>You cannot fire [src] to this target.</span>"
			return
		user.visible_message("<span class='notice'>[user] starts loading \a [mortar_shell.name] into [src].</span>",
		"<span class='notice'>You start loading \a [mortar_shell.name] into [src].</span>")
		playsound(loc, 'sound/weapons/gunporn/rpgreload.ogg', 50, 1)
		busy = 1
		if(do_after(user, 15, src))
			user.visible_message("<span class='notice'>[user] loads \a [mortar_shell.name] into [src].</span>",
			"<span class='notice'>You load \a [mortar_shell.name] into [src].</span>")
			visible_message("\icon[src] <span class='danger'>The [name] fires!</span>")
			user.drop_inv_item_to_loc(mortar_shell, src)
			playsound(loc, 'sound/effects/mortar_fire.wav', 50, 1)
			busy = 0
			firing = 1
			flick(icon_state + "_fire", src)
			mortar_shell.forceMove(src)

			var/turf/G = get_turf(src)

			for(var/mob/M in range(7))
				shake_camera(M, 3, 1)
			spawn(travel_time) //What goes up
				playsound(T, 'sound/effects/mortar_falling.wav', 50, 1)
				spawn(45) //Must go down //This should always be 45 ticks!
					mortar_shell.detonate(T)
					del(mortar_shell)
					firing = 0
		else
			busy = 0

//TODO change mortar fluff and desc
/obj/structure/mortar/fixed
	desc = "A manual, crew-operated mortar system intended to rain down 80mm goodness on anything it's aimed at. Uses manual targetting dials. Insert round to fire. This one is bolted and welded into the ground."
	fixed = 1

//The portable mortar item
/obj/item/mortar_kit
	name = "\improper M402 mortar portable kit"
	desc = "A manual, crew-operated mortar system intended to rain down 80mm goodness on anything it's aimed at. Needs to be set down first"
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_m402_carry"
	unacidable = 1
	w_class = 5

/obj/item/mortar_kit/attack_self(mob/user)
	user.visible_message("<span class='notice'>[user] starts deploying [src].",
	"<span class='notice'>You start deploying [src].")
	playsound(loc, 'sound/weapons/gunporn/rpgoneuse_deploying.ogg', 25, 1)
	if(do_after(user, 40, src))
		user.visible_message("<span class='notice'>[user] deploys [src].",
		"<span class='notice'>You deploy [src].")
		playsound(loc, 'sound/items/Deconstruct.ogg', 25, 1)
		var/obj/structure/mortar/M = new /obj/structure/mortar(get_turf(user))
		M.dir = user.dir
		del(src)


////////////////////////////////////////////////////////////////////////////////////////////
/////////////////Mortar Shell Values//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/mortar_shell
	name = "\improper 80mm mortar shell"
	desc = "An unlabeled 80mm mortar shell, probably a casing."
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_ammo_cas"
	w_class = 5
	var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment = 1)
	var/num_fragments = 5  //total number of fragments produced by the grenad
	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

/obj/item/mortar_shell/proc/detonate(var/turf/T)

	forceMove(T)


obj/item/mortar_shell/he
	name = "\improper 80mm High Explosive mortar shell"
	desc = "An 80mm mortar shell, loaded with a Highly Explosive Charge."
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_ammo_he"
	spread_range = 0

/obj/item/mortar_shell/he/detonate(var/turf/T)

	explosion(T, 0, 3, 5, 7)

obj/item/mortar_shell/frag
	name = "\improper 80mm Fragmentation mortar shell"
	desc = "An 80mm mortar shell, loaded with a small charge surrounded by Deadly Metal Pellets."
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_ammo_he"
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive = 1)
	num_fragments = 290  //total number of fragments produced by the grenade
	spread_range = 8

/obj/item/mortar_shell/frag/detonate(var/turf/T)

	explosion(T, 0, 1, 2, 7)
	src.fragmentate(T, num_fragments, spread_range, fragment_types)

/obj/item/mortar_shell/smoke
	name = "\improper 80mm smoke mortar shell"
	desc = "An 80mm mortar shell, loaded with smoke dispersal agents."
	icon_state = "mortar_ammo_smk"
	var/datum/effect/effect/system/smoke_spread/bad/smoke

	New()
		..()
		smoke = new /datum/effect/effect/system/smoke_spread/bad()
		smoke.attach(src)

/obj/item/mortar_shell/smoke/detonate(var/turf/T)

	explosion(T, 0, 1, 2, 7)
	playsound(T, 'sound/effects/smoke.ogg', 25, 1, 4)
	forceMove(T) //AAAAAAAA
	smoke.set_up(6, 0, T, null, 6)
	smoke.start()
	smoke = null
	qdel(src)

/obj/item/mortar_shell/flare
	name = "\improper 80mm flare mortar shell"
	desc = "An 80mm mortar shell, loaded with an illumination flare."
	icon_state = "mortar_ammo_flr"


/obj/item/mortar_shell/flare/detonate(var/turf/T)
//WIP

/obj/structure/closet/crate/mortar_ammo/mortar_kit
	name = "\improper M402 mortar kit"
	desc = "A crate containing a basic set of a mortar and some shells, to get an engineer started."

/obj/structure/closet/crate/mortar_ammo/mortar_kit/New()
	..()
	new /obj/item/mortar_kit(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/device/binoculars/nato/range(src)

/obj/structure/closet/crate/mortar_ammo/mortar_ammo_offensive/New()
	..()
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)

/obj/structure/closet/crate/mortar_ammo/mortar_ammo_support/New()
	..()
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)


//Will have to create WP versions if sprites differ between both factions.

