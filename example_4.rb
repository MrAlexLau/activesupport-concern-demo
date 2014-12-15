# example 4 - an attempt to refactor example 4 by including BoardGameHelpers directly into YahtzeeHelper. Note that this example fails when YahtzeeHelper is included.

module BoardGameHelpers
  def self.included(base)
    puts "The base is #{base}"
    base.class_eval do
      def self.dice_roll
        (1..6).to_a.sample
      end
    end
  end
end

module YahtzeeHelper
  include BoardGameHelpers

  def self.included(base)
    puts "The base is #{base}"
    puts "A sample dice roll is #{base.dice_roll}" # oops, this fails since the base class is wrong
  end
end

class Yahtzee
  include YahtzeeHelper
end

y = Yahtzee.new

