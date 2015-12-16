require_relative '../concerns/findable'

class Artist
  attr_accessor :name
  
  extend Concerns::Findable
  # include Savable
  
  def initialize(name)
    @name = name
  end
  
end