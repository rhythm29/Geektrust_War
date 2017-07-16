require './battle_resource'
module Enemy
  class Falicornia

    def self.build_enemy
      Enemy::Falicornia.new
    end

    @horse
    @elephant
    @armoured_tank
    @sling_gun

    def set_horses (power,strength)
      @horse = Main::BattleResource.new(power,strength)
      self
    end

    def set_elephant (power,strength)
      @elephant = Main::BattleResource.new(power,strength)
      self
    end

    def set_armoured_tank (power,strength)
      @armoured_tank = Main::BattleResource.new(power,strength)
      self
    end

    def set_sling_gun (power,strength)
      @sling_gun = Main::BattleResource.new(power,strength)
      self
    end

    def battle
      p "the battle with falicornia"
    end

  end
end
