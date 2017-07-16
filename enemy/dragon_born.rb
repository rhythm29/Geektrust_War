require './battle_resource'
module Enemy
	class DragonBorn

		def initialize(power, strength)
			dragon = Main::BattleResource.new(power,strength)
	  end

	  def battle
      p "the battle with dragon born"
    end
  end
end