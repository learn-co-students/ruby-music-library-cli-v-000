module Music_Common
  module C_Methods
    @@all = []

    def all
      @@all
    end

    def destroy_all
        self.all.clear
    end

    def create(name)
      s = new(name)
      s
    end
  end
  module I_Methods
    attr_accessor :name

    def initialize(name)
      @name = name
      save
    end

    def save
      if self.class.all.include?(self)
        return nil
      end

      self.class.all << self
    end
  end
end
