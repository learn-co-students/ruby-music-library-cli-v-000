# the "Persistable" implements 0 methods.
module Persistable
  # the "Persistable::InstanceMethods" implements 1 method
  module InstanceMethods
    def save # Instance method
      # rather than "self.all" ... you must use "self.class.all" Avi will explain later
      self.class.all << self                # must use self.all instead of @@all
    end
  end

  # the "Persistable::ClassMethods" implements 2 methods
  module ClassMethods
    # the classes that are extended by this module are passed into it as an argument (base)
    def self.extended(base) # this is a hook; whenever a class in ruby is extended, this will fire
      puts "#{base} has been extended by #{self}"
      base.class_variable_set(:@@all, [])
    end

    def destroy_all # Class method
      self.all.clear                  # must use self.all instead of @@all
    end

   # This method was added from the video: https://www.youtube.com/watch?v=iClea2crypU at: 24:23 / 1:21:13
   # ...it is not part of the actual lab, but I'm including it to expand the functionality so I understand more
    def count                        # must use self.all instead of @@all
      self.all.size
    end
  end
end
