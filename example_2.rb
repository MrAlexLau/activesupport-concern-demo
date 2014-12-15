# example 2 - rewriting the module using ActiveSupport::Concern
require 'active_support/concern'

module BoardGameHelpers
  extend ActiveSupport::Concern

  included do |base|
    puts "BoardGameHelpers included in #{base}"
  end

  def start
    puts 'starting game!'
  end

  module ClassMethods # Note that this name is a convention
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

