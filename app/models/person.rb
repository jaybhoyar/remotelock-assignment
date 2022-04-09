# frozen_string_literal: true

require 'date'
require_relative 'city'

class Person
  attr_accessor :first_name, :last_name, :birthdate, :city

  def initialize(hash)
    hash.each { |k, v| public_send("#{k}=", v) }
  end

  def stringify_person_details
    "#{self.first_name}, #{self.city[:name]}, #{birthdate.strftime('%-m/%-d/%Y')}"
  end
end
