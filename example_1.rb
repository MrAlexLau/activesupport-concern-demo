# example 1 - a simple example of a module
module BoardGameHelpers
  def self.included(base)
    base.extend BoardGameMethods
    puts "BoardGameHelpers included in #{base}"
  end

  def start
    puts 'starting game!'
  end

  module BoardGameMethods
    def read_from_file(filename)
      puts "Reading game from #{filename}"
      return self.new # return a new game instance
    end
  end
end

class Yahtzee
  include BoardGameHelpers
end

y = Yahtzee.read_from_file('sample_game.txt')
y.start

