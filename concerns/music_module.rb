module Concerns

  module Findable


    def find_by_name(name)
      self.all.detect {|item| item.name == name }
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        self.create(name)
      else self.find_by_name(name)
      end
    end

    def find_or_create_by_name_for_file(name)
      if self.find_by_name(name) == nil
        self.new(name)
      else self.find_by_name(name)
      end
    end


  end


  #
  #   # def initialize(name)
  #   #   @name = name
  #   # end
  #
  #   def self.destroy_all
  #     @@all=[]
  #   end
  #
  #   def self.create(name)
  #     self.new(name)
  #     @@all <<self
  #   end
  #
  #   def self.all
  #     @@all
  #   end
  #
  # end
  #
  # module InstanceMethods
  #   attr_accessor :name
  #   def initialize(name)
  #     @name = name
  #   end
  #
  #   def save
  #     @@all << self
  #   end
  # end
end
