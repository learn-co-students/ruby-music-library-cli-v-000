module Concerns
  module Findable
    def find_by_name(name)
      self.all.find{|o| o.name == name}
    end

    def create(name)
      new(name).tap{ |o| o.save }
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || create(name)
    end
  end

end
