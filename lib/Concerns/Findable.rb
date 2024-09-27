module Concerns
  module Findable

    def destroy_all
      self.all.clear
    end

    def create(name)
      self.new(name)
    end

    def find_by_name(name)
      self.all.detect{|item| item.name == name}
    end

    def find_or_create_by_name(name)
      if self.find_by_name(name)
        return self.find_by_name(name)
      else
        self.create(name)
      end
    end

  end

  module Instance

     def save
       self.class.all << self
     end


  end
end
