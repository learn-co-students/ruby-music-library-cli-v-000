module Concerns::Findable

def find_by_name(name)
    self.all.detect{|a| a.name}
  end




  def create_by_name (name)
    a = self.new(name)
    a.save
    return a
  end

  def find_or_create_by_name(name)
     if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end


















end #of Findable module