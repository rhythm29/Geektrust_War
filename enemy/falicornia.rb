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
      h,self.horse.strength = rule_one_two(Main::Lengaburu.horse.strength, self.horse.strength,2)
      e,self.elephant.strength = rule_one_two(Main::Lengaburu.elephant.strength, self.elephant.strength,2)
      t,self.armoured_tank.strength = rule_one_two(Main::Lengaburu.armoured_tank.strength, self.armoured_tank.strength,2)
      s,self.sling_gun.strength = rule_one_two(Main::Lengaburu.sling_gun.strength, self.sling_gun.strength,2)
      
      # Rule 3-4: Substitution
      l_arr = [h,e,t,s]
      f_arr = [self.horse.strength,self.elephant.strength,self.armoured_tank.strength,self.sling_gun.strength]

      l_power = [Main::Lengaburu.horse.power,Main::Lengaburu.elephant.power,Main::Lengaburu.armoured_tank.power,Main::Lengaburu.sling_gun.power]
      f_power = [self.horse.power,self.elephant.power,self.armoured_tank.power,self.sling_gun.power]


      p f_arr
      p l_arr
      p 
 
    # Find first non-0 
      f_i = 0
      while f_i< f_arr.size && f_arr[f_i]==0 do
        f_i+=1
      end  
      if(f_i==f_arr.size)
        p "Lengaburu deploys #{100-l_arr[0]} H, #{50-l_arr[1]} E, #{10-l_arr[2]} AT, #{5-l_arr[3]} SG and wins"
        return
      end  

    # Find fist non-0
      l_i = 0
      while l_i< l_arr.size && l_arr[l_i]==0 do
        l_i+=1
      end  
      if(l_i==l_arr.size)
        p "Lengaburu deploys #{100-l_arr[0]} H, #{50-l_arr[1]} E, #{10-l_arr[2]} AT, #{5-l_arr[3]} SG and loses"
        return
      end  
 
      while l_i< l_arr.size &&  f_i< f_arr.size do
        l_arr[l_i],f_arr[f_i] = rule_one_two(l_arr[l_i],f_arr[f_i],(l_power[l_i]*2.0)/f_power[f_i])
        if(l_arr[l_i]==0)
          l_i+=1
        end
        if(f_arr[f_i]==0)
          f_i+=1
        end  
      end

      if(f_i==f_arr.size)
        p "Lengaburu deploys #{100-l_arr[0]} H, #{50-l_arr[1]} E, #{10-l_arr[2]} AT, #{5-l_arr[3]} SG and wins"
        return
      end  
      if(l_i==l_arr.size)
        p "Lengaburu deploys #{100-l_arr[0]} H, #{50-l_arr[1]} E, #{10-l_arr[2]} AT, #{5-l_arr[3]} SG and loses"
        return
      end  

    end

    def rule_one_two(l_resource,f_resource,n)
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
