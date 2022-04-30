--
-- Created by IntelliJ IDEA.
-- User: heyqule
-- Date: 12/20/2020
-- Time: 5:04 PM
-- To change this template use File | Settings | File Templates.
--

local Game = require('__stdlib__/stdlib/game')

local ErmConfig = require('__enemyracemanager__/lib/global_config')
local ErmForceHelper = require('__enemyracemanager__/lib/helper/force_helper')
local ErmRaceSettingsHelper = require('__enemyracemanager__/lib/helper/race_settings_helper')
local CustomAttacks = require('__erm_marspeople__/prototypes/custom_attacks')

local Event = require('__stdlib__/stdlib/event/event')
local String = require('__stdlib__/stdlib/utils/string')

require('__erm_marspeople__/global')
-- Constants


local createRace = function()
    local force = game.forces[FORCE_NAME]
    if not force then
        force = game.create_force(FORCE_NAME)
    end

    force.ai_controllable = true;
    force.disable_research()
    force.friendly_fire = false;

    if settings.startup['enemyracemanager-free-for-all'].value then
        ErmForceHelper.set_friends(game, FORCE_NAME, false)
    else
        ErmForceHelper.set_friends(game, FORCE_NAME, true)
    end
end

local addRaceSettings = function()
    local race_settings = remote.call('enemy_race_manager', 'get_race', MOD_NAME)
    if race_settings == nil then
        race_settings = {}
    end

    race_settings.race =  race_settings.race or MOD_NAME
    race_settings.level =  race_settings.level or 1
    race_settings.tier =  race_settings.tier or 1
    race_settings.evolution_point =  race_settings.evolution_point or 0
    race_settings.evolution_base_point =  race_settings.evolution_base_point or 0
    race_settings.attack_meter = race_settings.attack_meter or 0
    race_settings.attack_meter_total = race_settings.attack_meter_total or 0
    race_settings.next_attack_threshold = race_settings.next_attack_threshold or 0

    race_settings.units = {
        { 'marspeople', 'miniufo' },
        { 'eye-ufo-a', 'eye-ufo-b', 'marspeople-icy', 'daimanji-dropship', 'marspeople-builder'},
        { 'ufo', 'marspeople-fire', 'daimanji-purpleball', 'daimanji-thunderbolt' },
    }
    race_settings.turrets = {
        {'laser-turret'},
        {'thunderbolt-turret'},
        {},
    }
    race_settings.command_centers = {
        {'tencore'},
        {},
        {}
    }
    race_settings.support_structures = {
        {'entrance_en','entrance_jp'},
        {'exit_en','exit_jp'},
        {},
    }
    race_settings.flying_units = {
        {'miniufo'},
        {'eye-ufo-a','eye-ufo-b'},
        {'ufo', 'daimanji-purpleball', 'daimanji-thunderbolt'}
    }
    race_settings.dropship = 'daimanji-dropship'
    race_settings.droppable_units = {
        {{ 'marspeople', 'miniufo' }, {2, 1}},
        {{ 'marspeople', 'marspeople-icy', 'miniufo', 'eye-ufo-a' }, {2, 2, 1, 1}},
        {{ 'marspeople', 'marspeople-icy', 'marspeople-fire', 'ufo', 'miniufo', 'eye-ufo-a', 'eye-ufo-b' }, {2, 2, 2, 1, 1, 1, 1}},
    }
    race_settings.construction_buildings = {
        {{ 'shortrange-laser-turret'}, {1}},
        {{ 'shortrange-laser-turret'}, {1}},
        {{ 'shortrange-laser-turret','exit_en', 'exit_jp'}, {3,1,1}},
    }
    race_settings.featured_groups = {
        --Unit list, spawn ratio
        {{'marspeople','miniufo'}, {2, 1}},
        {{'marspeople','marspeople-icy', 'marspeople-fire'}, {2, 1, 1}},
    }
    race_settings.featured_flying_groups = {
        {{'miniufo'}, {1}},
        {{'eye-ufo-a', 'eye-ufo-b'}, {1, 1}},
    }

    ErmRaceSettingsHelper.process_unit_spawn_rate_cache(race_settings)

    remote.call('enemy_race_manager', 'register_race', race_settings)

end

Event.on_init(function(event)
    createRace()
    addRaceSettings()
end)

Event.on_load(function(event)
end)

Event.on_configuration_changed(function(event)
    createRace()
    addRaceSettings()
end)

local attack_functions =
{
    [MARSPEOPLE_DROPSHIP_ATTACK] = function(args)
        CustomAttacks.process_dropship(args)
    end,
    [MARSPEOPLE_BUILDER_ATTACK] = function(args)
        CustomAttacks.process_builder(args)
    end
}
Event.register(defines.events.on_script_trigger_effect, function(event)
    if  attack_functions[event.effect_id] and
            CustomAttacks.valid(event, MOD_NAME)
    then
        attack_functions[event.effect_id](event)
    end
end)




