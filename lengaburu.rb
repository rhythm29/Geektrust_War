require './battle_resource'
module Main
  class Lengaburu

    @horse = Main::BattleResource.new(0.5,1000000)
    @elephant = Main::BattleResource.new(0.5,1000000)
    @armoured_tank = Main::BattleResource.new(0.5,1000000)
    @sling_gun = Main::BattleResource.new(0.5,1000000)

    class << self
      attr_accessor :horse, :elephant, :armoured_tank, :sling_gun
    end

  end
end
