---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 6/28/2021 9:38 PM
---

ErmMarsPeople = {}

require('__erm_marspeople__/global')
require('util')

local ErmConfig = require('__enemyracemanager__/lib/global_config')

local ERM_WeaponRig = require('__enemyracemanager__/lib/rig/weapon')

data:extend(
        {
            {
                type = "ammo-category",
                name = "marspeople-damage"
            },
})

data.erm_registered_race = data.erm_registered_race or {}
data.erm_registered_race[MOD_NAME] = true
-- This set of data is used for set up default autoplace calculation.
data.erm_spawn_specs = data.erm_spawn_specs or {}
table.insert(data.erm_spawn_specs, {
    mod_name=MOD_NAME,
    force_name=FORCE_NAME,
    moisture=1, -- 1 = Dry and 2 = Wet
    aux=1, -- 1 = red desert, 2 = sand
    elevation=1, --1,2,3 (1 low elevation, 2. medium, 3 high elavation)
    temperature=2, --1,2,3 (1 cold, 2. normal, 3 hot)
})

require "prototypes.projectiles"
require "prototypes.building.tencore"
require "prototypes.building.entrance_jp"
require "prototypes.building.entrance_en"
require "prototypes.building.exit_jp"
require "prototypes.building.exit_en"
require "prototypes.building.laser-turret"
require "prototypes.building.thunderbolt-turret"
require "prototypes.enemy.miniufo"
require "prototypes.enemy.ufo"
require "prototypes.enemy.eye-ufo-a"
require "prototypes.enemy.eye-ufo-b"
require "prototypes.enemy.marspeople"
require "prototypes.enemy.marspeople-fire"
require "prototypes.enemy.marspeople-icy"
require "prototypes.enemy.marspeople-builder"
require "prototypes.enemy.daimanji-purpleball"
require "prototypes.enemy.daimanji-dropship"
require "prototypes.enemy.daimanji-thunderbolt"

local max_level = ErmConfig.MAX_LEVELS

for i = 1, max_level + ErmConfig.MAX_ELITE_LEVELS do
    --Units
    ErmMarsPeople.make_miniufo(i)
    ErmMarsPeople.make_ufo(i)
    ErmMarsPeople.make_eye_ufo_a(i)
    ErmMarsPeople.make_eye_ufo_b(i)
    ErmMarsPeople.make_marspeople(i)
    ErmMarsPeople.make_marspeople_fire(i)
    ErmMarsPeople.make_marspeople_icy(i)
    ErmMarsPeople.make_marspeople_builder(i)
    ErmMarsPeople.make_daimanji_purpleball(i)
    ErmMarsPeople.make_daimanji_dropship(i)
    ErmMarsPeople.make_daimanji_thunderbolt(i)
end

for i = 1, max_level do
    --Building
    ErmMarsPeople.make_tencore(i)
    ErmMarsPeople.make_entrance_jp(i)
    ErmMarsPeople.make_entrance_en(i)
    ErmMarsPeople.make_exit_jp(i)
    ErmMarsPeople.make_exit_en(i)
    ErmMarsPeople.make_laser_turret(i)
    ErmMarsPeople.make_thunderbolt_turret(i)
end

