module Concerns::Findable
#  module ClassMethods
    def find_by_name(name)
      self.all.detect {|o| o.name == name}
    end

    def create(name)
    o = self.new
    o.name = name
    self.all << o
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


# end
end
