module GlassHelperReverseBooster

using ..Ahorn, Maple

@mapdef Entity "GlassHelper/ReverseBooster" RevBooster(x::Integer, y::Integer, red::Bool=false, twistSprite::String="objects/revBooster/twist/twist")

const placements = Ahorn.PlacementDict(
    "Reverse Booster (Glass Helper)" => Ahorn.EntityPlacement(
        RevBooster
    ),
    "Reverse Booster (Red) (Glass Helper)" => Ahorn.EntityPlacement(
        RevBooster,
        "point",
        Dict{String, Any}(
            "red" => true
        )
    )
)

function boosterSprite(entity::RevBooster)
    red = get(entity.data, "red", false)
    
    if red
        return "objects/booster/boosterRed00"
    else
        return "objects/booster/booster00"
    end
end

function twistSpriteFunction(entity::RevBooster)
    twistSprite = get(entity.data, "twistSprite", "objects/revBooster/twist/twist")
    
    return twistSprite * "00"
end

function Ahorn.selection(entity::RevBooster)
    x, y = Ahorn.position(entity)
    spriteTwist = twistSpriteFunction(entity)

    return Ahorn.getSpriteRectangle(spriteTwist, x, y)
end

function Ahorn.render(ctx::Ahorn.Cairo.CairoContext, entity::RevBooster, room::Maple.Room)
    spriteBooster = boosterSprite(entity)
    spriteTwist = twistSpriteFunction(entity)

    Ahorn.drawSprite(ctx, spriteBooster, 0, 0)
    Ahorn.drawSprite(ctx, spriteTwist, 0, 0)
end

end