class Employee
  attr_accessor :bonus_multiplier
  attr_reader :name

  def initialize(name='bob', bonus_multiplier=3)
    @name = name
    @bonus_multiplier = bonus_multiplier
    @salary = 10_000
  end

  def pay_bonus
    salary * bonus_multiplier
  end

  def get_value
    salary
  end

  def update_salary(new_salary)
    @salary = new_salary
  end

private
  attr_accessor :salary
end
