-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')
require('completelap')

function Precache( context )
--[[
  This function is used to precache resources/units/items/abilities that will be needed
  for sure in your game and that will not be precached by hero selection.  When a hero
  is selected from the hero selection screen, the game will precache that hero's assets,
  any equipped cosmetics, and perform the data-driven precaching defined in that hero's
  precache{} block, as well as the precache{} block for any equipped abilities.

  See GameMode:PostLoadPrecache() in gamemode.lua for more information
  ]]

  DebugPrint("[BAREBONES] Performing pre-load precache")

  -- Particles can be precached individually or by folder
  -- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed
  PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
  PrecacheResource("particle_folder", "particles/test_particle", context)

  -- Models can also be precached by folder or individually
  -- PrecacheModel should generally used over PrecacheResource for individual models
  PrecacheResource("model_folder", "particles/heroes/antimage", context)
  PrecacheResource("model", "particles/heroes/viper/viper.vmdl", context)
  PrecacheModel("models/heroes/viper/viper.vmdl", context)

  -- Sounds can precached here like anything else
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)

  -- Entire items can be precached by name
  -- Abilities can also be precached in this way despite the name
  PrecacheItemByNameSync("example_ability", context)
  PrecacheItemByNameSync("item_example_item", context)

  -- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
  -- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
  PrecacheUnitByNameSync("npc_dota_hero_ancient_apparition", context)
  PrecacheUnitByNameSync("npc_dota_hero_enigma", context)


  -- JUNGLE RACE PRECACHE
  --PrecacheModel("models/heroes/treant_protector/treant_protector.mdl", context )
  PrecacheResource( "model_folder", "models/courier/turtle_rider/", context )
  --PrecacheResource( "model_folder", "models/items/courier", context )
  --PrecacheResource( "model_folder", "models/courier", context )
  PrecacheResource( "model_folder", "models/creeps/neutral_creeps", context )
  --PrecacheResource( "soundfile", "*.vsndevts", context )
  --PrecacheResource( "particle", "*.vpcf", context )
  --PrecacheResource( "particle_folder", "particles", context )
  PrecacheResource( "particle_folder", "particles/holdout_lina", context )
  PrecacheResource( "model_folder", "models/items/warlock/golem/doom_of_ithogoaki", context )
  PrecacheResource( "model_folder", "models/items/hex/sheep_hex/", context )
  --PrecacheResource( "soundfile_folder", "sound", context )
  PrecacheUnitByNameSync("npc_dota_hero_shadow_shaman", context)
  PrecacheUnitByNameSync("npc_dota_hero_obsidian_destroyer", context)
  PrecacheUnitByNameSync("npc_dota_hero_bane", context)
  PrecacheUnitByNameSync("npc_dota_hero_pugna", context)
  PrecacheUnitByNameSync("npc_dota_hero_naga_siren", context)
  PrecacheUnitByNameSync("npc_dota_hero_phantom_assassin", context)
  PrecacheUnitByNameSync("npc_dota_hero_sniper", context)
  PrecacheUnitByNameSync("npc_dota_hero_riki", context)
  PrecacheUnitByNameSync("npc_dota_hero_vengefullspirit", context)
  PrecacheUnitByNameSync("npc_dota_hero_gyrocopter", context)
  PrecacheUnitByNameSync("npc_dota_hero_beastmaster", context)
  PrecacheUnitByNameSync("npc_dota_hero_crystal_maiden", context)
  PrecacheUnitByNameSync("npc_dota_hero_elder_titan", context)
  PrecacheUnitByNameSync("npc_dota_hero_enchantress", context)
  PrecacheUnitByNameSync("npc_dota_hero_razor", context)
  PrecacheUnitByNameSync("npc_dota_hero_kunkka", context)
  PrecacheUnitByNameSync("npc_dota_hero_lion", context)
  PrecacheUnitByNameSync("npc_dota_hero_doom_bringer", context)
  PrecacheUnitByNameSync("npc_dota_hero_viper", context)
  PrecacheUnitByNameSync("npc_dota_hero_visage", context)
  PrecacheUnitByNameSync("npc_dota_hero_brewmaster", context)
  PrecacheUnitByNameSync("npc_dota_hero_lich", context)
  PrecacheResource( "particle", "particles/econ/generic/generic_buff_1/generic_buff_1.vpcf", context )
  --PrecacheUnitByNameSync("npc_dota_hero_warlock", context)
  --PrecacheResource("models/heroes/undying/undying_minion.vmdl", "*.vmdl", context )
  --[[
    Precache things we know we'll use.  Possible file types include (but not limited to):
      PrecacheResource( "model", "*.vmdl", context )
      PrecacheResource( "soundfile", "*.vsndevts", context )
      PrecacheResource( "particle", "*.vpcf", context )
      PrecacheResource( "particle_folder", "particles/folder", context )
  ]]
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:InitGameMode()
end