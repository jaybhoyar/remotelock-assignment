# frozen_string_literal: true

class City
  attr_accessor :name, :abbr

  CITIES = [
    { name: 'Atlanta', abbr: 'Atlanta' },
    { name: 'Los Angeles', abbr: 'LA' },
    { name: 'New York City', abbr: 'NYC' }
  ].freeze

  def self.find(name)
    CITIES.find do |city|
      city[:name].downcase == name.downcase || city[:abbr].downcase == name.downcase
    end
  end
end
