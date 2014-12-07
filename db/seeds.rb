# Check for showdown import file...

require 'yaml'
require 'json'
require 'open-uri'
require 'uri'

def import_hash(json, group)
    if group == :formats
        json.each do |key, data|
          p = Pokemon.find_by_key(key)
          if not p.nil?
             
              if !data["tier"].nil?
                tier = data["tier"]
                if Format.find_by_name(tier).nil?
                  f = Format.new
                  f.name = data["tier"]
                  f.save()
                  puts "Saved new format: #{f.name}"
                end

                fp = FormatPokemon.new
                fp.pokemon = p
                fp.format = Format.find_by_name(tier)
                fp.save()
                puts "I put #{p.species} to tier: #{tier} - yeah"
              end
          
              if !data["randomBattleMoves"].nil?
                  data["randomBattleMoves"].each do |move|
                      m = Move.find_by_key(move)
                      if not m.nil?
                         random_battle_move = RandomBattleMove.new
                         random_battle_move.pokemon = p
                         random_battle_move.move = m
                         random_battle_move.save()
                         puts "Random Battle Move #{m.name} for #{p.species} saved." 
                      end
                  end
              end
          end
        end
    end
    if group == :pokedex
        $pokemon_types = Hash.new
        $pokemon_abilities = Hash.new
        errorPokes = Hash.new
        json.each do |key, data|
            if Pokemon.find_by_species(data["species"]).nil?
               pokemon = Pokemon.new
               pokemon.pokedex = data["num"]
               pokemon.species = data["species"]
               pokemon.key = key.to_s

               basestats = Basestat.new()
               basestats.hp = data["baseStats"]["hp"]
               basestats.atk = data["baseStats"]["atk"]
               basestats.def = data["baseStats"]["def"]
               basestats.spa = data["baseStats"]["spa"]
               basestats.spd = data["baseStats"]["spd"]
               basestats.spe = data["baseStats"]["spe"]

               pokemon.height = data["height"]
               pokemon.weight = data["weight"]
               pokemon.color = data["color"]
               if data["forme"] and data["forme"] == "Mega"
                  pokemon.mega = true
                  pokemon.mega_forme = data["formeLetter"] unless data[":formeLetter"].nil?
               end
                $pokemon_abilities[pokemon.species] = Hash.new
               data["abilities"].each do |identifier, ability_name|
                   $pokemon_abilities[pokemon.species][identifier] = ability_name
               end

               basestats.save()
               pokemon.basestat = basestats
               if not pokemon.save()
                   errorPokes[key] = data
               else
                   $pokemon_types[pokemon.species] = data["types"]
                   puts "Pokemon #{pokemon.species} successfully added to DB..."
               end
           else
               puts "Pokemon (#{data["species"]}) already in DB"
           end
        end
    end

    if group == :abilities
        json.each do |key, data|
           if Ability.find_by_key(key.to_s).nil?
              ability = Ability.new
              ability.key = key.to_s
              ability.name = data["name"]
              ability.rating = data["rating"]
              ability.num = data["num"]
              if ability.save()
                  puts "Ability: #{ability.name} successfully added to DB..."
              else
                  puts "Couldn't save ability: #{ability.name}"
              end
           end
        end

    end

    if group == :typechart
        json.each do |key, data|
            if Type.find_by_name(key.to_s).nil?
                type =  Type.new
                type.name = key.to_s
                type.color = key.downcase
                if type.save()
                    puts "Type #{type.name} successfully saved to db."
                else
                    puts "Could not save type: #{key.to_s}"
                end
            else
                puts "Type already in DB"
            end
        end
    end

    if group == :items
       json.each do |key, data|
           if Item.find_by_key(key.to_s).nil?
               item = Item.new
               item.name = data["name"]
               item.key = data[key.to_s]
               item.num = data["num"]
               item.desc = data["desc"]
               item.gen = data["gen"] unless data["gen"].nil?

               details = ItemDetail.new()
               if not data["megaStone"].nil?
                  details.megastone = true
                  details.mega_evolves = Pokemon.find_by_species(data["megaEvolves"])
               end

               if not data["isBerry"].nil?
                  details.berry = !!data["isBerry"]
               end

               if not data["fling"].nil?
                  details.fling = true
                  details.fling_bp = data["fling"]["basePower"]
               end

               if data["isUnreleased"]
                  details.unreleased = !!data["isUnreleased"]
               end
               details.save()
               item.details = details

               if item.save()
                   details.item = item
                   details.save
                   puts "Item: #{item.name} successfully saved to db"
               else
                   puts "item #{item.name} wasn't saved to db"
               end

           else
               puts "Item (#{data["name"]}) already in db."
           end
       end
    end

    if group == :moves
        $move_types = Hash.new
        json.each do |key, data|
            if not Move.find_by_key(key.to_s)
                m = Move.new()
                m.key = key.to_s
                m.num = data["num"]
                m.category = data["category"]
                m.desc = data["desc"]
                m.pp = data["pp"]
                m.accuracy = data["accuracy"]
                m.priority = data["priority"]
                m.name = data["name"]

                m.target = data["target"]
                m.desc_short = data["shortDesc"]
                m.is_viable = !!data["isViable"]
                m.is_contact = !!data["isContact"]
                m.type = Type.find_by_name(data["type"])
                m.crit_ratio = data["critRatio"] || 1
                m.basepower = data["basePower"] unless data["basePower"].nil?
                m.protectable = !data["isNotProtectable"]
                if m.save()
                    $move_types[m.key] = data["type"]
                    puts "Move #{data["name"]} successfully saved to DB."
                else
                    puts "Konnte Move nicht speichern."
                end
            end
        end
    end

    if group == :learnsets
      json.each do |key, data|
        p = Pokemon.find_by_key(key)
        if not p.nil?
          data.each do |move_key, data|
            move = Move.find_by_key(move_key)
            if not move.nil?
              mp = MovePokemon.new
              mp.move = move
              mp.pokemon = p
              mp.options = data
              mp.save()
              puts "Saved move: #{move.name} for #{p.species} => #{data.to_json}"
            end
          end
        end
      end
    end


end

showdown_yaml = File.join(File.dirname(File.expand_path(__FILE__)),  "showdown.yml")
if File.exists?(showdown_yaml)
   puts "Importing new Showdown Data..."
   options = YAML.load(open(showdown_yaml))
   puts options
   showdown_data = options[:target_directory]
   showdown_files = options[:files]

   showdown_files.each do |group, files|
       files.each do |file|
          file_path = File.join(options[:target_directory], group.to_s, file)
          #puts JSON.parse(open(file_path).read())
          puts "Processing file: #{file} for group #{group}"
          sleep 2
          import_hash(JSON.parse(open(file_path).read()), group)
       end
   end
   $move_types.each do |move_key, type|
       puts "Fixing move: #{move_key}"
      move = Move.find_by_key(move_key)
      move.type = Type.find_by_name(type)
      move.save()
      puts "Done!"
   end

   puts "Fixing Pokemon Types..."
   $pokemon_types.each do |pokemon_species, types|
      begin
          pokemon = Pokemon.find_by_species(pokemon_species)
          typing = Typing.new
          typing.pokemon = pokemon
          types.each do |type|
             typing.types.push Type.find_by_name(type)
          end
          typing.save()
          pokemon.typing = typing
          pokemon.save()
          puts "Set typing for #{pokemon.species} to #{(typing.types.map do |t| t.name end).join(',')}))"
      rescue
          puts "Error when setting type for #{pokemon.species} - check manually."
      end
   end

   puts "Fixing pokemon abilities"
   $pokemon_abilities.each do |pokemon_key, data|
       pokemon = Pokemon.find_by_species(pokemon_key)

       data.each do |identifier, ability_name|
          begin
              pokemon.abilities.push Ability.find_by_name(ability_name)
          rescue
          end
      end
      pokemon.save()
   end

   puts Dir.getwd
   sprite_dir = "app/assets/images/sprites/"
   puts "Adding Sprites to Pokemon"
   Pokemon.all.each do |pokemon|
       pokemon_sprite = pokemon.key
       pokemon_sprite =  pokemon_sprite.downcase.gsub(/mega/, "-mega").gsub(/-mega-x/, "-megax").gsub(/-mega-y/, "-megay")
       pokemon_sprite.gsub!(/-meganium/, "meganium")
       pokemon_sprite.gsub!(/nidoranf/, "nidoran-f")
       pokemon_sprite.gsub!(/nidoranm/, "nidoran-m")
       pokemon_sprite.gsub!(/rotom/) {|rot| rot + "-" }
       if pokemon_sprite == "rotom-"
        pokemon_sprite = "rotom"
      end

       pokemon_sprite.gsub!(/therian/, "-therian")
       
       if pokemon_sprite[-1] == '/'
          pokemon_sprite = pokemon_sprite.split("")
          pokemon_sprite.pop()
          pokemon_sprite = pokemon_sprite.join("")
       end
       sprite_path = "./" + sprite_dir + pokemon_sprite.to_s + ".gif"
       if File.exists?(sprite_path)
           pokemon.sprite = File.open(sprite_path)
           pokemon.save!
       else
           puts "Sprite not found for: #{pokemon.species} - path: #{sprite_path}"
       end


   end

   puts "Importing smogon data when possible..."
   puts "Creating author: pokedex@smogon.com"
   User.create(:email => "pokedex@smogon.com", :password => "yourchoiceok?")
   base_query = Hash.new
   base_query[:pokemon] = {
       :gen => "xy",
   }
   base_query[:"$"] = [
       "name",
       "alias",
       "gen", {
           :genfamily => ['alias', 'gen']
       },
       {:alts => [
           'alias',
           'suffix',
           'height',
           'weight',
           'gkpower',
           {:types => ['alias', 'name', 'gen']},
           {
               :"$groupby" => 'modifier',
               :effectives => [
                   'modifier',
                   {:type => [
                       'alias', 'name', 'gen'
                   ]}
               ],
           },
           {:abilities => [
               'alias', 'name', 'gen', 'description'
           ]},

           {:tags =>  ['name', 'alias', 'shorthand', 'gen']},
           'hp',
           'patk',
           'pdef',
           'spatk',
           'spdef',
           'spe'

       ]},
       {:family => [
           'root',
           {:members => ['name', 'alias', 'gen']},
           {
               :evolutions => ['preevo', 'evo']
           }
           ]},
       {:"$tree" => [
           'root',
           ['members', 'name'],
           ['evolutions', 'preevo', 'evo'],
           ]},
       {:movesets => [
           'name',
           {:tags => ['alias', 'shorthand', 'name', 'gen']},
           {:items => ['alias', 'name', 'gen', 'description']},
           {:abilities => ['alias', 'name', 'gen']},
           {:evconfigs => ['hp', 'patk', 'pdef', 'spatk', 'spdef', 'spe']},
           {:natures => ['hp', 'patk', 'pdef', 'spatk', 'spdef', 'spe']},
           {
               :"$groupby" => "slot",
               :moveslots => ['slot', {
                       :move => ['name', 'alias', 'gen']
               }],
           },
           'description'
       ]},

       {:moves => [
             'name',
             'alias',
             'category',
             'power',
             'accuracy',
             'pp',
             'description',
             {:type => ['alias', 'name', 'gen']}
        ]}
   ]



   Pokemon.all.each do |pokemon|
       base_query[:pokemon][:alias] = pokemon.key
       query_json = URI.encode base_query.to_json
       query_path = "http://www.smogon.com/dex/api/query?q=#{query_json}"
       begin
       open(query_path) do |query_result|
           result_hash = JSON.parse(query_result.read())
           if result_hash["result"].size > 0
               result_hash = result_hash["result"][0]
               begin

                   # starting with the evolutions
                   family = result_hash["family"][0]
                   if not family.nil?
                       if !family["preevo"].nil?
                           puts "Saving preevo of: #{pokemon.species}"
                           evo = Evolution.new
                           evo.pokemon = Pokemon.find_by_species(family["preevo"]["alias"])
                           evo.kind = "preevo"
                           evo.evolution = pokemon
                           if evo.save()
                               puts "#{pokemon.species} Evolution successfully saved."
                           else
                               puts "Could not save evolution for #{pokemon.species}"
                           end
                       end

                       if !family["evos"].nil?
                           family["evos"].each do |evohash|
                              evohash.each do |kind, data|
                                  if kind == "preevo" and data.is_a?(Hash)
                                     evo = Evolution.new
                                     evo.kind = "preevo"
                                     evo.pokemon = Pokemon.find_by_species(family["preevo"]["alias"])
                                     evo.evolution = pokemon
                                     evo.save()
                                     puts "Saved evo for: #{evo.pokemon.species}"
                                  end
                              end
                           end
                       end
                   end

                   # lets get to the movesets
                   puts "Saving movesets..."
                   movesets = result_hash["movesets"]
                   movesets.each do |moveset|
                       m = Moveset.new
                       #moveset nature
                       puts "Processing natures..."
                       moveset["natures"].each do |nature_hash|
                           query = Hash.new
                           nature_hash.each do |property, value|
                                query[property.to_sym] = value.to_f
                           end

                           if Nature.where(query)[0].nil?
                              n = Nature.new()
                              n.hp = nature_hash["hp"]
                              n.patk = nature_hash["patk"]
                              n.pdef = nature_hash["pdef"]
                              n.spatk = nature_hash["spatk"]
                              n.spdef = nature_hash["spdef"]
                              n.spe = nature_hash["spe"]
                              n.save()
                              m.nature = n
                              m.nature_id = n.id
                          else
                              m.nature = Nature.where(query)[0]
                              m.nature_id = Nature.where(query)[0].id
                          end
                          puts "Nature successfully saved."
                       end

                       m.pokemon = pokemon
                       m.author = User.where(:email => "pokedex@smogon.com")[0]
                       m.description = moveset["description"]
                       m.name = moveset["name"]
                       puts "Saving abilities..."
                       moveset["abilities"].each do |ability_hash|
                           m.abilities.push Ability.find_by_name(ability_hash["name"])
                       end
                       puts "Saving moveslots..."

                       # processing move slots
                       moveset["moveslots"].each do |moveslot_hash|
                          moveslot = Moveslot.new
                          moveslot.slot = moveslot_hash["slot"]
                          moveslot_hash["moves"].each do |move_hash|
                             moveslot.moves.push Move.find_by_name(move_hash["name"])
                          end
                          moveslot.save()
                          m.moveslots.push moveslot
                       end

                       puts "Saving items..."
                       moveset['items'].each do |item_hash|
                          m.items.push Item.find_by_name(item_hash["name"])
                       end


                       puts "Saving EVSpread"
                       moveset['evconfigs'].each do |evconfig|

                           ev = EvSpread.new
                           ev.hp = evconfig["hp"]
                           ev.atk = evconfig["patk"]
                           ev.def = evconfig["pdef"]
                           ev.spa = evconfig["spatk"]
                           ev.spd = evconfig["spdef"]
                           ev.spe = evconfig["spe"]
                           ev.save()
                           m.ev_spreads.push ev
                       end
                       if m.save()
                           pokemon.movesets.push(m)
                           pokemon.save()
                          puts "Successfully saved pokemon: #{pokemon.species}"
                       end
                   end
               rescue Exception => e
                   puts "Could not save pokemon #{pokemon.species} - not found or error happend."
                   puts e.message
                   puts e.backtrace.inspect
               end
           end
       end
       rescue
           puts "Error trying to lookup #{pokemon.species} on smogon.com"
       end

   end


   puts "done setting types... here is a summary... lul"
   sleep 2
   # summary
   puts "====================================="
   puts "Summary"
   puts "====================================="
   sleep 1 # fancy
   puts "Added: #{Pokemon.count} Pokemon to DB"
   sleep 1
   puts "Added: #{Move.count} Moves to DB"
   sleep 1
   puts "Added: #{Type.count} Types to DB"
   sleep 1
   puts "Added: #{Item.count} Items to DB"
   sleep 1
   puts "Added: #{Ability.count} Abilities to DB"
   sleep 1
   puts "====================================="
   puts "Done! :)"
end

if Rails.env.development?

    if AdminUser.create(email: 'pascal@teambrewery.io', :password => 'local')
       puts "Created admin: pascal@teambrewery.io - password: local - (development only)"
    end

end
