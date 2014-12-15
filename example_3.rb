# example 3 - including 2 modules in the same class, but only because the first module is a dependency for the second

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
  def self.included(base)
    puts "The base is #{base}"
    puts "A sample dice roll is #{base.dice_roll}"
  end
end

class Yahtzee
  include BoardGameHelpers # We need to include this dependency for YahtzeeHelper
  include YahtzeeHelper # YahtzeeHelper is the module that BoardGameHelpers really needs
end

y = Yahtzee.new

