require 'byebug'

class Employee

  attr_accessor :name, :salary, :title, :boss

  def initialize(name, salary, title, boss)
    self.name = name
    self.salary = salary
    self.title = title
    self.boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end


class Manager < Employee

  attr_accessor :employees

  def bonus(multiplier)
    sum = 0
    employees.each do |employee|
        sum += employee.bonus(multiplier)
        sum += employee.salary * multiplier if employee.is_a?(Manager)
    end
    sum
  end


end

ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)
ned.employees = [darren]
darren.employees = [david, shawna]

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
