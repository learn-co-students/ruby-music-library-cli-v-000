module Group
  module InstanceMethods

    def save
      self.class.all << self
    end

  end

  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      song = self.new(name)

      # @@all << song
    end




  end

end
