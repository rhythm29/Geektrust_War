=begin

### Assumptions ######
* The project is written and used by the folks at Langaburu. 
* Everytime an attack occur, Langaburu analyse the battle power and strength of the enemy and make a respective class in the *enemy* module.
* Rules of war can be different for each enemy(depending on strength and power), hence the *battle function* is coded for each enemy.
* e.g: There can be an enemy Orcania with horses twice as power as that of Langaburu, but elephants being 5 times weaker.

=end



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
      h,self.horse.strength = battle_of_two_resources(Main::Lengaburu.horse.strength, self.horse.strength, POWER_MULTIPLIER)
      e,self.elephant.strength = battle_of_two_resources(Main::Lengaburu.elephant.strength, self.elephant.strength,POWER_MULTIPLIER)
      t,self.armoured_tank.strength = battle_of_two_resources(Main::Lengaburu.armoured_tank.strength, self.armoured_tank.strength,POWER_MULTIPLIER)
      s,self.sling_gun.strength = battle_of_two_resources(Main::Lengaburu.sling_gun.strength, self.sling_gun.strength,POWER_MULTIPLIER)

      # Rule 3-4: Substitution
      l_arr = [h,e,t,s]
      f_arr = [self.horse.strength,self.elephant.strength,self.armoured_tank.strength,self.sling_gun.strength]

      l_power = [Main::Lengaburu.horse.power,Main::Lengaburu.elephant.power,Main::Lengaburu.armoured_tank.power,Main::Lengaburu.sling_gun.power]
      f_power = [self.horse.power,self.elephant.power,self.armoured_tank.power,self.sling_gun.power]


      # Loop over falicornia resources, and try to confront any non 0 module
      f_i = 0
      langaburu_wins = true
      while f_i< f_arr.size do
        if(f_arr[f_i]!=0 && f_i>0 && l_arr[f_i-1]>0)
            # battle with lower ranked resource of lengaburu
            l_arr[f_i-1],f_arr[f_i] = battle_of_two_resources(l_arr[f_i-1],f_arr[f_i],(l_power[f_i-1]*POWER_MULTIPLIER)/f_power[f_i])
        end
        #If falicornia resource is still non 0, try with higher ranked resource
        if(f_arr[f_i]!=0 && f_i< f_arr.size-1 && l_arr[f_i+1]>0)
            # battle with lower ranked resource of lengaburu
            l_arr[f_i+1],f_arr[f_i] = battle_of_two_resources(l_arr[f_i+1],f_arr[f_i],(l_power[f_i+1]*POWER_MULTIPLIER)/f_power[f_i])
        end
          # Lengaburu unable to fully counter the falicornia resource, so it will loose.
          # war will however continue until lengaburu made its best efforts
        if f_arr[f_i] > 0
            langaburu_wins = false
        end
          f_i+=1
      end
        
        if langaburu_wins
          p "Lengaburu deploys #{100-l_arr[0]} H, #{50-l_arr[1]} E, #{10-l_arr[2]} AT, #{5-l_arr[3]} SG and wins"
          return
        else
          p "Lengaburu deploys #{100-l_arr[0]} H, #{50-l_arr[1]} E, #{10-l_arr[2]} AT, #{5-l_arr[3]} SG and loose"

        end

    end


    #Apply rule:1,2. on two resources of the enemies. n is the power multiplier
    def battle_of_two_resources(l_resource,f_resource,n)
      #h: remaining horses for Lengaburu
       rem = f_resource - (n * l_resource)
      if rem > 0
        f_resource = rem
        rem = 0;
      else
        f_resource = 0
        rem = (rem.abs/n).floor
          end
          return rem,f_resource
        end
      end
    end
