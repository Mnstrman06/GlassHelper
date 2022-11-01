using System;
using Celeste;
using Celeste.Mod.Entities;
using Celeste.Mod.GlassHelper;
using Microsoft.Xna.Framework;
using Monocle;
using MonoMod.Utils;
using On.Celeste;

namespace Celeste.Mod.GlassHelper.Boosters
{
    [CustomEntity("GlassHelper/ReverseBooster")]

    public class ReverseBooster : Booster
    {

        private Sprite sprite;

        private string directory;

        public ReverseBooster(EntityData data, Vector2 offset) : base(data.Position + offset, data.Bool("red"))
        {
            //stuff idk
            //Add(GFX.SpriteBank.Create("glassHelperRevBooster"));

            directory = data.Attr("twistSprite", "objects/revBooster/twist/twist").TrimEnd(new char[1]
            {
                '/'
            });

            Add(sprite = new Sprite(GFX.Game, directory));
            sprite.AddLoop("twist", "", 0.1f);
            sprite.Play("twist");
            sprite.CenterOrigin();

        }

        //i usually put my variables towards the bottom of the class but others put them towards the top it doesn't really matter
    }
}