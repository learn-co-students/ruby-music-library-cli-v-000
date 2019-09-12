module Concerns
  module Findable
    def find_by_name(f_name)
      self.all.detect {|x| x if x.name == f_name}
    end
    def find_or_create_by_name(f_name)
      self.find_by_name(f_name) == nil ? self.create(f_name) : self.find_by_name(f_name)
    end
  end
end
