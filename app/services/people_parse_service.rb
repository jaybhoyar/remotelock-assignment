# frozen_string_literal: true

require_relative '../models/person'

class PeopleParseService
  @@formats = {
    dollar_format: '$',
    percent_format: '%'
  }

  def initialize(person, format_type)
    @seperator = @@formats[format_type]
    @rows = person.split("\n")
    @columns = get_columns(@rows.shift)
  end

  def process
    @rows.map do |row|
      arr = row.split(@seperator).map(&:strip)
      params = Hash[@columns.zip(arr)]
      params[:city] = City.find(params[:city])
      params[:birthdate] = Date.parse(params[:birthdate])
      Person.new(params)
    end
  end

  private
  
    def get_columns(string)
      string.split(@seperator).map(&:strip).map(&:to_sym)
    end
end
