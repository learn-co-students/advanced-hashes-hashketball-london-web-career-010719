# Write your code here!
def game_hash
  gamehash = {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      }
    },
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end


def num_points_scored(player)
  game_hash.each do |key, data|
    data[:players].each do |name, stats|
      return stats[:points] if name == player
    end
  end
end

def shoe_size(player)
  game_hash.each do |key, data|
    data[:players].each do |name, stats|
      return stats[:shoe] if name == player
    end
  end
end

def team_colors(teamname)
  game_hash.each do |key, data|
    return data[:colors] if data[:team_name] == teamname
  end
end

def team_names
  game_hash.collect {|key, data| data[:team_name]}
end

def player_numbers(teamname)
newarray=[]
  game_hash.each do |key, data|
      if data[:team_name] == teamname
        data[:players].each {|name, stats| newarray << stats[:number]}
      end
  end
  newarray
end

def player_stats(player)
  game_hash.each do |key, data|
    data[:players].each {|name, stats| return stats if name == player}
  end
end

def big_shoe_rebounds
  largest = {:name => nil, :size => 0}
  game_hash.each do |key, value|
    value[:players].each do |name, stats|
      if shoe_size(name) > largest[:size]
        largest[:name] = name
        largest[:size] = shoe_size(name)
      end
    end
  end

  return player_stats(largest[:name])[:rebounds]
end

def most_points_scored
  current={:name => nil, :points => 0}
  game_hash.each do |key, data|
    data[:players].each do |name, stats|
       if stats[:points] > current[:points]
         current[:name] = name
         current[:points] = stats[:points]
       end
    end
  end
  current[:name]
end

def winning_team
winner = {team_name: nil, points:0}
  game_hash.each do |key, data|
    total = 0
    data[:players].each do |player, stats|
      total += player_stats(player)[:points]
    end
    if total > winner[:points]
      winner[:team_name] = data[:team_name]
      winner[:points] = total
    end
  end
  winner[:team_name]
end

def player_with_longest_name
longest = ""
  game_hash.each do |key, data|
    data[:players].keys.each {|player|
      longest = player if player.length > longest.length}
  end
longest
end

def most_steals
moststeals={name: nil, steals: 0}
game_hash.each do |key, data|
  data[:players].each do |name, stats|
     if stats[:steals] > moststeals[:steals]
       moststeals[:name] = name
       moststeals[:steals] = stats[:steals]
     end
  end
end
moststeals[:name]
end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end
