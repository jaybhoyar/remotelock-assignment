# frozen_string_literal: true

require_relative 'services/people_parse_service'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people = []
    @params.each_key do |key|
      people << PeopleParseService.new(@params[key], key).process if valid_key(key)
    end
    people.flatten!
    people.sort_by! { |p| [p.send(@params[:order]) ? 1 : 0, p.send(@params[:order])] } unless @params[:order].nil?
    people.map!(&:stringify_person_details) unless people.empty?
    people
  end

  private
    def valid_key(key)
      !@params[key].nil? && key.to_s.include?('format')
    end
end
