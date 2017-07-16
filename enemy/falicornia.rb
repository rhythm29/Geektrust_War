require './battle_resource'
require './battle_power'

module Enemy
  class Falicornia

    def self.build_enemy
      Enemy::Falicornia.new
    end

    def set_horses (strength)
      @horse = Main::BattleResource.new($HORSE_POWER, strength)
      self
    end
    def set_elephant (strength)
      @elephant = Main::BattleResource.new($ELEPHANT_POWER, strength)
      self
    end

    def set_armoured_tank (strength) 
      @armoured_tank = Main::BattleResource.new($ARMOURED_TANK_POWER, strength)
      self
    end

    def set_sling_gun (strength)
      @sling_gun = Main::BattleResource.new($SLING_GUN_POWER, strength)
      self
    end

    def battle
      p "the battle with falicornia"
    end
  end
end
