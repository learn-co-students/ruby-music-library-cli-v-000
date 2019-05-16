

module Concerns::Findable


  # module ClassMethods

    # def self.all
    #   @@all
    # end
    #
    # def self.destroy_all
    #   @@all.clear
    # end

    # def create(name)
    #   song = self.new(name)
    #   song.save
    #   song
    # end

    def find_by_name(name)
      self.all.detect { |obj| obj.name == name  }
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end
  # end

  # module InstanceMethods
  #   # def save
  #   #   self.class.all << self
  #   # end
  # end

end
