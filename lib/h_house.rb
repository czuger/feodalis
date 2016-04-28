require 'active_record'
require_relative 'al_alliance'

# This class store a house, this is the base definition of a house and is game board independent
class HHouse < ActiveRecord::Base

  has_many :vassals, class_name: HHouse, foreign_key: :suzerain_id

  def self.create_house( code_name )
    house = HHouse.find_or_create_by!(code_name: code_name )
    house
  end

  def create_vassal( code_name )
    vassal = HHouse.create_house( code_name )
    vassals << vassal
    vassal
  end

  def vassal?
    suzerain_id
  end

  def suzerain?
    !vassal?
  end

end