local drawableSprite = require("structs.drawable_sprite")
local utils = require("utils")

local booster = {}

booster.name = "GlassHelper/ReverseBooster"
booster.depth = 0
booster.placements = {
    {
        name = "default",
        data = {
            red = false,
            twistSprite = "objects/revBooster/twist/twist"
        }
    },
    {
        name = "red",
        data = {
            red = true,
            twistSprite = "objects/revBooster/twist/twist"
        }
    }
}

function booster.sprite(room, entity)
    local sprites = {}

    local twistTexture = drawableSprite.fromTexture("objects/revBooster/twist/twist00", entity)

    local color = entity.red and "objects/booster/boosterRed00" or "objects/booster/booster00"
    local colorBooster = drawableSprite.fromTexture(color, entity)

    table.insert(sprites, twistTexture)
    table.insert(sprites, colorBooster)

    return sprites
end

function booster.selection(room, entity)
    local rect = utils.rectangle(entity.x - 16, entity.y - 16, 32, 32)

    return rect
end

return booster