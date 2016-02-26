module Concerns

  module Findable

    def find_by_name(name)
      self.all.find {|obj| obj.name == name}
    end

    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      found ? found : self.create(name)
    end

  end

  module MaintainableInstance
    def save
      self.class.all << self
    end
  end

end
