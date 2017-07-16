require './battle_resource'
module Main
  class Lengaburu

    @horse = Main::BattleResource.new($HORSE_POWER, 100)
    @elephant = Main::BattleResource.new($ELEPHANT_POWER, 50)
    @armoured_tank = Main::BattleResource.new($ARMOURED_TANK_POWER, 10)
    @sling_gun = Main::BattleResource.new($SLING_GUN_POWER, 5)

    class << self
      attr_accessor :horse, :elephant, :armoured_tank, :sling_gun
    end

  end
end
