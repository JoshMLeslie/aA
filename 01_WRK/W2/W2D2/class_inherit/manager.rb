require_relative 'employee'

class Manager < Employee
  attr_accessor :underlings

  def initialize(underlings=[], name='frank', bonus=5)
    @underlings = underlings
    super(name, bonus)
  end

  def pay_bonus
    calculate_underlings * bonus_multiplier
  end

  def add_underling(underling)
    underlings << underling
  end

private
  def calculate_underlings
    total_salaries = underlings.map { | cog | cog.get_value }

    total_salaries.reduce(:+)
  end

end
