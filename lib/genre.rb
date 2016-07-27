class Genre

  module Concerns::Findable

  attr_accessor :name

  @@all = []


  def initialize(name)
    @name = name
  end

end

end
