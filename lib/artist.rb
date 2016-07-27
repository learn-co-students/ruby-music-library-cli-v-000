class Artist

  module Concerns::Findable

  attr_accessor :name

  @@all = []


  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

end

end
