module Concerns::Findable
#  module ClassMethods
    def find_by_name(name)
      self.all.detect {|o| o.name == name}
    end

    def create(name)
      o = new(name)
      self.all << o
      o
    end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


# end
end
