module Memorable

  module ClassMethods

    def all
      self.all
    end

    def destroy_all
      self.all.clear
    end

  # TODO how to make create works at song, artist, genre classes
    # def self.create(name)
    #   new_object = self.new(name)
    #   new_object.save
    #   new_object
    # end
  end

  module InstanceMethods

    def save
      self.class.all << self
    end

  end

end
