require 'pry'

module Concerns::Findable

  attr_accessor :name, :song

  @@all = []

  def all
    @@all
  end

  def destroy_all
    @@all.clear
  end

  def find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    self.create(name) unless self.find_by_name(name)
    self.find_by_name(name)
  end

end