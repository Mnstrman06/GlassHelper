using System;
using Celeste;
using Celeste.Mod;
using Monocle;
using Microsoft.Xna.Framework;
using Celeste.Mod.GlassHelper.Boosters;
namespace Celeste.Mod.GlassHelper
{
    public class GlassHelperModule : EverestModule
    {
        public static GlassHelperModule Instance;

        public GlassHelperModule()
        {
            Instance = this;
        }

        public override void Load()
        {
            On.Celeste.Booster.PlayerBoosted += Booster_PlayerBoosted;
        }

        private void Booster_PlayerBoosted(On.Celeste.Booster.orig_PlayerBoosted orig, Booster self, Player player, Vector2 direction)
        {
            orig(self, player, direction);
            if (self is ReverseBooster)
            {
                player.Speed *= -1f;
                player.DashDir *= -1f;
            }
        }
    
        public override void Unload()
        {
            On.Celeste.Booster.PlayerBoosted -= Booster_PlayerBoosted;
        }
    }
}
