require './enemy/falicornia'
require './battle_power'
require './enemy/dragon_born'

while input = gets
  data = input.split(' attacks with ')

  #Strength array for each battle resource
  strength = data[1].split(',').map {|x| x[/\d+/].to_i}

  #Our enemy is Falicornia, parse accordingly and then battle
  if data[0] == 'Falicornia'
    enemy = Enemy::Falicornia.build_enemy
    strength = data[1].split(',').map {|x| x[/\d+/].to_i}

    enemy.set_horses($HORSE_POWER, strength[0])
    enemy.set_elephant($ELEPHANT_POWER, strength[1])
    enemy.set_armoured_tank($ARMOURED_TANK_POWER, strength[2])
    enemy.set_sling_gun($SLING_GUN_POWER, strength[3])

  elsif data[0] == 'Dragonborn'
    enemy = Enemy::DragonBorn.new($DRAGON_POWER, strength[0])      
  end

  #Enemy is set, Battle now!
  enemy.battle

end
