	//Cold war stuff

//Rifle caliber

/obj/item/projectile/bullet/rifle/a762x39
	penetrating = 1
	armor_penetration = 98 //was 23
	penetration_modifier = 0.3
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a762x39/Initialize()
	damage = rand(32, 41)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x39/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x39/ap
	armor_penetration = 98 //was 35
	penetration_modifier = 0.3


/obj/item/projectile/bullet/rifle/a762x51
	penetrating = 1
	armor_penetration = 98 //was 34
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(35, 44)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x51/tr
	icon_state = "bullet_tracer"
	penetrating = 1
	armor_penetration = 98 //was 34
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

	New()
		damage = rand(40, 50)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x51/ap
	armor_penetration = 98 //was 45
	penetration_modifier = 0.4

/obj/item/projectile/bullet/rifle/a762x54
	penetrating = 1
	armor_penetration = 98 //was 31
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(37, 46)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x54/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x54/ap
	armor_penetration = 98 //was 60
	penetration_modifier = 0.4

/obj/item/projectile/bullet/rifle/a762x53
	penetrating = 1
	armor_penetration = 98 //was 31
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(37, 46)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x53/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x53/ap
	armor_penetration = 98 //was 60
	penetration_modifier = 0.4

/obj/item/projectile/bullet/rifle/a545x39
	armor_penetration = 98 //was 26
	penetration_modifier = 0.3
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(34,  38)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a545x39/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a545x39/ap
	armor_penetration = 98 //was 30
	penetration_modifier = 0.2

/obj/item/projectile/bullet/rifle/a556x45
	armor_penetration = 98 //was 29
	penetration_modifier = 0.5 //slightly less energy than 545 but does more internal damage
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(30, 35)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a556x45/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a556x45/ap
	armor_penetration = 98 //was 35
	penetration_modifier = 0.5

//Pistol caliber


/obj/item/projectile/bullet/rifle/a45
	armor_penetration = -10 //was 4
	penetration_modifier = 0.7 //does big internal organ damage if it penetrates
	agony = 25

	New()
		damage = rand(28, 33)

/obj/item/projectile/bullet/rifle/a45/tr
	icon_state = "bullet_tracer"

/obj/item/projectile/bullet/rifle/a45/ap
	armor_penetration = 20
	penetration_modifier = 0.1

/obj/item/projectile/bullet/rifle/a9x19
	armor_penetration = 0 //was 12
	penetration_modifier = 0.5 ///does big internal organ damage if penetrates
	agony = 23

	New()
		damage = rand(23, 29)

/obj/item/projectile/bullet/rifle/a9x19/tr
	icon_state = "bullet_tracer"

/obj/item/projectile/bullet/rifle/a9x19/ap
	armor_penetration = 98 //was 20
	penetration_modifier = 0.1

/obj/item/projectile/bullet/rifle/a9x18
	armor_penetration = -5 //was 8
	penetration_modifier = 0.5 ///does big internal organ damage if penetrates
	agony = 21

	New()
		damage = rand(21, 28)


/obj/item/projectile/bullet/rifle/a9x18/tr
	icon_state = "bullet_tracer"

/obj/item/projectile/bullet/rifle/a9x18/ap
	armor_penetration = 98 //was 13

/obj/item/projectile/bullet/rifle/a4mm
//	fire_sound = 'sound/weapons/minigun_1sec.ogg'
	damage = 15
	armor_penetration = 15
	kill_count = 120

/obj/item/projectile/bullet/rifle/a127x108mm
//	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'
	armor_penetration = 98 //was 54
	penetration_modifier = 0.9 ///12mm shells gotta hurt
	agony = 46
	penetrating = 3

	New()
		damage = rand(46, 54)

/obj/item/projectile/bullet/rifle/a127x108mm/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a127x108mm/ap
	armor_penetration = 98 //was 75
	penetration_modifier = 0.6


/obj/item/projectile/bullet/rifle/a50cal
//	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'
	armor_penetration = 98 //was 45
	penetration_modifier = 0.9 ///12mm shells gotta hurt
	agony = 42
	penetrating = 3

	New()
		damage = rand(48, 51)

/obj/item/projectile/bullet/rifle/a50cal/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a50cal/ap
	armor_penetration = 98 //was 65
	penetration_modifier = 0.4

/obj/item/projectile/bullet/ags30x29mm
	name = "AGS' bullet"
	icon_state = "vog"
	damage = 90
	penetrating = 0
	step_delay = 1.2
//	impact_force = 1
	kill_count = 60
	fire_sound = null//here we gonna use sound in AGS and not in bullets

//proc/explosion(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range, adminlog = 1, z_transfer = UP|DOWN, shaped)
/obj/item/projectile/bullet/ags30x29mm/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 0, 1, 3, 3)

/obj/item/projectile/bullet/ags30x29mm/pow
	damage = 110
	agony = 20
	armor_penetration = 98 //was 1
	step_delay = 1.2
	penetrating = 0
	kill_count = 70

/obj/item/projectile/bullet/ags30x29mm/pow/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 0, 2, 3, 3)

/obj/item/projectile/bullet/mk19_40x53mm
	name = "MK19' bullet"
	icon_state = "vog" ////////fix
	damage = 100
	penetrating = 0
	step_delay = 1.2
//	impact_force = 1
	kill_count = 60

/obj/item/projectile/bullet/mk19_40x53mm/on_impact(var/atom/target, blocked = 0)
	explosion(target, 0, 1, 5, 4)//a little bit explosive that 30x29


/obj/item/projectile/bullet/mk19_40x53mm/pow
	damage = 120
	armor_penetration = 98 //was 1
	step_delay = 1.2
//	impact_force = 1
	penetrating = 0
	kill_count = 70

/obj/item/projectile/bullet/mk19_40x53mm/on_impact(var/atom/target, blocked = 0)
	explosion(target, 0, 1, 4, 3)

/obj/item/projectile/bullet/rgprocket
	name = "rpg shell"
	icon_state = "rocket"
	damage = 0
	nodamage = 1
	step_delay = 1
	penetrating = 0
	kill_count = 40
	fire_sound = null//here we gonna use sound in AGS and not in bullets
	var/ricochetchance = 0

	muzzle_type = /obj/effect/projectile/rocket/rpg
	breech_type = /obj/effect/projectile/rocket/rpg/breech

/obj/item/projectile/bullet/rgprocket/muzzle_effect(var/matrix/T)
	if(silenced)
		return

	if(ispath(muzzle_type))
		var/obj/effect/projectile/M = new muzzle_type(get_turf(src))

		if(istype(M))
			M.set_transform(T)
			M.pixel_x = location.pixel_x
			M.pixel_y = location.pixel_y
			M.activate()

	if(ispath(breech_type))
		var/obj/effect/projectile/M1 = new breech_type(get_turf(src))

		if(istype(M1))
			M1.set_transform(T)
			M1.pixel_x = -location.pixel_x
			M1.pixel_y = -location.pixel_y
			M1.activate()

/obj/item/projectile/bullet/rgprocket/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 1, 2, 3, 2)

/obj/item/projectile/bullet/rgprocket/he
	penetrating = 0

/obj/item/projectile/bullet/rgprocket/he/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 1, 3, 5, 4)

/obj/item/projectile/bullet/rgprocket/gustaf
	icon_state = "gustaf"

/obj/item/projectile/bullet/rgprocket/finn
	icon_state = "finn"
