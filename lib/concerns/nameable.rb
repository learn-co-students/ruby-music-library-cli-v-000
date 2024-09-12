module Concerns::Nameable
  module ClassMethods
    def create(name)
     new(name).tap{ |o| o.save }
    end
  end
end
