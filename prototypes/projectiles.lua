---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 11/6/2021 2:07 PM
---

local Sprites = require('__stdlib__/stdlib/data/modules/sprites')
local fireutil = require('__base__/prototypes/fire-util')
local math3d = require "math3d"
data:extend({
    ------- Fire -------
    fireutil.add_basic_fire_graphics_and_effects_definitions(
    {
        type = "fire",
        name = "marspeople-fire-flame",
        flags = {"placeable-off-grid", "not-on-map"},
        damage_per_tick = {amount = 3 / defines.time.second, type = "fire"},
        maximum_damage_multiplier = 1,
        damage_multiplier_increase_per_added_fuel = 1,
        damage_multiplier_decrease_per_tick = 0.005,

        spawn_entity = "fire-flame-on-tree",

        spread_delay = 300,
        spread_delay_deviation = 180,
        maximum_spread_count = 100,

        emissions_per_second = 0.005,

        initial_lifetime = 300,
        lifetime_increase_by = 150,
        lifetime_increase_cooldown = 4,
        maximum_lifetime = 600,
        delay_between_initial_flames = 10,
        --initial_flame_count = 1,
    }),
    {
        type = "sticker",
        name = "marspeople-fire-sticker",
        flags = {"not-on-map"},

        animation =
        {
            filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
            line_length = 8,
            width = 60,
            height = 118,
            frame_count = 25,
            blend_mode = "normal",
            animation_speed = 1,
            scale = 0.2,
            tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }, --{ r = 1, g = 1, b = 1, a = 0.35 },
            shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
            draw_as_glow = true
        },

        duration_in_ticks = 2 * defines.time.second,
        damage_per_tick = { amount = 2 / defines.time.second, type = "fire" },
        spread_fire_entity = "fire-flame-on-tree",
        fire_spread_cooldown = 30,
        fire_spread_radius = 0.75
    },
    -------- Projectile --------
    {
        type = "projectile",
        name = "mini-ufo-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = { amount = 15, type = "laser" },
                        apply_damage_to_trees = true
                    },
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/mini-ufo-projectile.png",
            frame_count = 3,
            width = 32,
            height = 32,
            priority = "high",
            animation_speed = 0.4,
            draw_as_glow = true,
        }
    },
    {
        type = "projectile",
        name = "ufo-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = { amount = 30, type = "laser" },
                        apply_damage_to_trees = true
                    },
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/ufo-projectile.png",
            frame_count = 1,
            width = 8,
            height = 35,
            priority = "high",
            animation_speed = 1,
            draw_as_glow = true,
        }
    },
    {
        type = "projectile",
        name = "eye-ufo-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = { amount = 20, type = "electric" },
                        apply_damage_to_trees = true
                    },
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/eye-ufo-projectile.png",
            frame_count = 8,
            width = 32,
            height = 32,
            priority = "high",
            animation_speed = 0.5,
            draw_as_glow = true,
        }
    },
    {
        type = "projectile",
        name = "daimanji-purple-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = { amount = 30, type = "electric" },
                        apply_damage_to_trees = true
                    },
                    {
                        type = "create-entity",
                        entity_name = "marspeople-purple-explosion"
                    }
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/daimanji-purple-ball.png",
            frame_count = 12,
            width = 48,
            height = 64,
            priority = "high",
            animation_speed = 0.5,
            draw_as_glow = true,
        }
    },
    {
        type = "projectile",
        name = "marspeople-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "marspeople-projectile-hit"
                    },
                    {
                        type = "damage",
                        damage = { amount = 5, type = "laser" },
                        apply_damage_to_trees = true
                    },
                    {
                        type = "damage",
                        damage = { amount = 5, type = "explosion" },
                        apply_damage_to_trees = true
                    }
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/marspeople-projectile.png",
            frame_count = 12,
            width = 32,
            height = 32,
            priority = "high",
            animation_speed = 0.4,
            run_mode = "forward-then-backward",
        }
    },
    {
        type = "projectile",
        name = "marspeople-fire-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "marspeople-projectile-hit"
                    },
                    {
                        type = "create-fire",
                        entity_name = "marspeople-fire-flame",
                        show_in_tooltip = true,
                        initial_ground_flame_count = 2
                    },
                    {
                        type = "create-sticker",
                        sticker = "marspeople-fire-sticker",
                        show_in_tooltip = true
                    }
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/marspeople-projectile.png",
            frame_count = 12,
            width = 32,
            height = 32,
            priority = "high",
            animation_speed = 0.4,
            run_mode = "forward-then-backward",
        }
    },
    {
        type = "projectile",
        name = "marspeople-icy-projectile",
        flags = { "not-on-map" },
        acceleration = 0.01,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "marspeople-icy-projectile-hit"
                    },
                    {
                        type = "damage",
                        damage = { amount = 15, type = "cold" },
                        apply_damage_to_trees = true
                    },
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/marspeople-icy-projectile.png",
            frame_count = 12,
            width = 32,
            height = 32,
            priority = "high",
            animation_speed = 0.4,
            run_mode = "forward-then-backward",
        }
    },
    {
        type = "projectile",
        name = "daimanji-thunderbolt",
        flags = { "not-on-map" },
        acceleration = 0.05,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "marspeople-thunderbolt-explosion"
                    },
                    {
                        type = "damage",
                        damage = { amount = 15, type = "cold" },
                        apply_damage_to_trees = true
                    },
                }
            }
        },
        animation = {
            filename = "__erm_marspeople__/graphics/entity/projectiles/thunderbolt-effect.png",
            frame_count = 20,
            width = 96,
            height = 192,
            priority = "high",
            animation_speed = 0.5,
            line_length = 10,
            lines_per_file = 2,
        }
    },
    --- Explosions
    {
        type = "explosion",
        name = "marspeople-projectile-hit",
        flags = { "not-on-map" },
        animations = {
            {
                filename = "__erm_marspeople__/graphics/entity/projectiles/marspeople-projectile-hit.png",
                width = 48,
                height = 48,
                frame_count = 12,
                animation_speed = 0.4,
                shift = util.by_pixel(0, 16),
                draw_as_glow = true,
            }
        }
    },
    {
        type = "explosion",
        name = "marspeople-icy-projectile-hit",
        flags = { "not-on-map" },
        animations = {
            {
                filename = "__erm_marspeople__/graphics/entity/projectiles/marspeople-icy-projectile-hit.png",
                width = 48,
                height = 48,
                frame_count = 12,
                animation_speed = 0.4,
                shift = util.by_pixel(0, 16),
                draw_as_glow = true,
            }
        }
    },
    {
        type = "explosion",
        name = "marspeople-explosion",
        flags = { "not-on-map" },
        animations = {
            {
                filename = "__erm_marspeople__/graphics/entity/sfx/explosion.png",
                width = 96,
                height = 128,
                frame_count = 20,
                animation_speed = 0.3,
                shift = util.by_pixel(0, 16),
                draw_as_glow = true,
            }
        }
    },
    {
        type = "explosion",
        name = "marspeople-purple-explosion",
        flags = { "not-on-map" },
        animations = {
            {
                filename = "__erm_marspeople__/graphics/entity/sfx/purple-explosion.png",
                width = 96,
                height = 128,
                frame_count = 20,
                animation_speed = 0.3,
                shift = util.by_pixel(0, 16),
                draw_as_glow = true,
            }
        }
    },
    {
        type = "explosion",
        name = "marspeople-ground-explosion",
        flags = { "not-on-map" },
        animations = {
            {
                filename = "__erm_marspeople__/graphics/entity/sfx/ground_explosion.png",
                width = 128,
                height = 192,
                frame_count = 24,
                animation_speed = 0.4,
                shift = util.by_pixel(0, 16),
                draw_as_glow = true,
            }
        }
    },
    {
        type = "explosion",
        name = "marspeople-thunderbolt-explosion",
        flags = { "not-on-map" },
        animations = {
            {
                filename = "__erm_marspeople__/graphics/entity/projectiles/thunderbolt-explosion.png",
                width = 64,
                height = 64,
                frame_count = 4,
                animation_speed = 0.4,
                shift = util.by_pixel(0, 16),
                draw_as_glow = true,
            }
        }
    },
})
