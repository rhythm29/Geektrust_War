require './battle_resource'
require './battle_power'
require './lengaburu'

module Enemy
  class Falicornia

      attr_accessor :horse, :elephant, :armoured_tank, :sling_gun
    

    POWER_MULTIPLIER = 2
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
      h,self.horse.strength = rule_one_two(Main::Lengaburu.horse.strength, self.horse.strength)
      h,self.elephant.strength = rule_one_two(Main::Lengaburu.elephant.strength, self.elephant.strength)
      h,self.armoured_tank.strength = rule_one_two(Main::Lengaburu.armoured_tank.strength, self.armoured_tank.strength)
      h,self.sling_gun.strength = rule_one_two(Main::Lengaburu.sling_gun.strength, self.sling_gun.strength)
      p self.sling_gun.strength
    end

    def rule_one_two(l_resource,f_resource)
      #h: remaining horses for Lengaburu
       rem = f_resource - (2 * l_resource)
      if rem > 0
        f_resource = rem
        rem = 0;
      else
        f_resource = 0
        rem = (rem.abs/2).floor
      end
      return rem,f_resource
    end
  end
end
