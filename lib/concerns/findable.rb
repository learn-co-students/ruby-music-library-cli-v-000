module Concerns::Findable

def find_by_name(name)
    self.all.detect{|a| a.name}
  end
end #of Findable module