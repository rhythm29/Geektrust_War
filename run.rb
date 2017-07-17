=begin

## Solution

* Basic unit of power is horses. Horses are the battle resources with minimum battle power, 
so we can denote all battle resources' power wrt to horse power.
* Each battle resource has two properties - (i) Battle Power: battle power of a resource with respect to the horse, 
(ii) strength: number of elements.
=end


require './enemy/falicornia'
require './battle_power'
require './enemy/dragon_born'

while input = gets
  data = input.split(' attacks with ')

  # Parse the string input to get the strength array.
  strength = data[1].split(',').map {|x| x[/\d+/].to_i}

  #Our enemy is Falicornia, parse accordingly and then battle
  if data[0] == 'Falicornia'
    enemy = Enemy::Falicornia.build_enemy
    strength = data[1].split(',').map {|x| x[/\d+/].to_i}

    enemy.set_horses(strength[0])
    enemy.set_elephant(strength[1])
    enemy.set_armoured_tank(strength[2])
    enemy.set_sling_gun(strength[3])

  elsif data[0] == 'Dragonborn'
    enemy = Enemy::DragonBorn.new($DRAGON_POWER, strength[0])      
  end

  #Enemy is set, Battle now!
  enemy.battle
end
