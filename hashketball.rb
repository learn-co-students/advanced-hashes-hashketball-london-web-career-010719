require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: [
        "Black",
        "White"
      ],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
      away: {
        team_name: "Charlotte Hornets",
        colors: [
          "Turquoise",
          "Purple"
        ],
        players: {
          "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2,
          },
          "Bismak Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
          "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          "Brendan Haywood" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
          }
        }
      }
    }
    game_hash
end


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |team_name, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player_name)
  number_points_scored = "failed"
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :players
        team_attributes.each do |players, data|
          if players == player_name
            data.each do |key, value|
              if key == :points
                number_points_scored = value
              end
            end
          end
        end
      end
    end
  end
  number_points_scored
end

def shoe_size(player_name)
  shoe_size = "failed"
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :players
        team_attributes.each do |players, data|
          if players == player_name
            data.each do |key, value|
              if key == :shoe
                shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  team_colors = "failed"
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :team_name
        if team_attributes == team_name
        team_data.each do |key, team_attributes|
          if key == :colors
            team_colors = team_attributes
             end
          end
        end
      end
    end
  end
  team_colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :team_name
        #binding.pry
        team_names.push(team_attributes)
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    back_up_hash = nil
    team_data.each do |key, team_attributes|
      if key == :team_name
        if team_attributes == team_name
          #in the right location
         back_up_hash = game_hash[location]
          back_up_hash.each do |key, team_attributes|
            if key == :players
              team_attributes.each do |players, data|
                data.each do |key, value|
                  if key == :number
                    player_numbers.push(value)
                    player_numbers = player_numbers.sort
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  player_stats_hash = nil
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :players
        team_attributes.each do |players, data|
          if players == player_name
            player_stats_hash = data
            # data.each do |key, value|
            #
            #   if key == :points
            #     number_points_scored = value
            #   end
            # end
          end
        end
      end
    end
  end
  player_stats_hash
end

def big_shoe_rebounds
  holder_key = "key"
  holder_value = 0
  answer = {holder_key => holder_value}
  holder_value = answer[holder_key]
  comparison_hash.each do |key,value|
    if value >= holder_value
      holder_value = value
      holder_key = key
    end
  end
  player_name = holder_key
  number_of_rebounds = nil
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :players
        team_attributes.each do |players, data|
          if players == player_name
            data.each do |key, value|
              if key == :rebounds
                number_of_rebounds = value
              end
            end
          end
        end
      end
    end
  end
  number_of_rebounds
end


def comparison_hash
  comparison_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |key, team_attributes|
      if key == :players
        team_attributes.each do |players, data|
          data.each do |data, value|
            if data == :shoe
              shoe_size = value
              comparison_hash[players] = shoe_size
            end
          end
        end
      end
    end
  end
  comparison_hash
end
