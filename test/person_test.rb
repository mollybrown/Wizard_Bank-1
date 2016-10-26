gem 'minitest'
require_relative '../lib/wizards.rb'
require 'minitest/autorun'
require 'minitest/pride'

class WizardsTest < Minitest::Test

  def test_a_person_exists
  assert_instance_of Person, Person.new("Mary", 500)
  end

  def test_person_has_a_name
    person = Person.new("Mary", 500)
    assert_equal "Mary", person.name
  end

  def test_person_has_money
    person = Person.new("Mary", 500)
    assert_equal 500, person.level_of_cash
  end

end
