require_relative '../concerns/findable'

class Genre
  attr_accessor :name
  
  extend Concerns::Findable
  # include Savable
  
  def initialize(name)
    @name = name
  end
  
end