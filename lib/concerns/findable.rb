module Concerns
  module Findable
    def find_by_name(name)
      @@all.detect {|song| song.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
  module ClassMethods
    def self.extended(base)
      puts "#{base} has been extended by #{self}."
      base.class_instance_variable_set(@@all, [])
end
