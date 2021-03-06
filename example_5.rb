# example 5 - including 2 modules in the same class, but only because the first module is a dependency for the second
require 'active_support/concern'

module BoardGameHelpers
  extend ActiveSupport::Concern

  included do |base|
    puts "The base is #{base}"
    base.class_eval do
      def self.dice_roll
        (1..6).to_a.sample
      end
    end
  end
end

module YahtzeeHelper
  extend ActiveSupport::Concern
  include BoardGameHelpers

  included do |base|
    puts "The base is #{base}"
    puts "A sample dice roll is #{base.dice_roll}"
  end
end

class Yahtzee
  include YahtzeeHelper
end

y = Yahtzee.new

