require 'pry'
module Memorable
  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      song = self.new(name)
      song.save
      song
    end


  end

  module InstanceMethods


    def save
      self.class.all << self
    end

  end

end
