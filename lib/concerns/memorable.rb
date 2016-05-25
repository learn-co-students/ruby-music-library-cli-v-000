module Memorable

  module InstanceMethods

    def save
      self.class.all << self
    end

  end #-------------InstanceMethods

  module ClassMethods

    def destroy_all
      self.all.clear
    end

  end #-----------ClassMethods

end #------Memorable
