module Concerns::Findable


  def find_by_name(input)
    self.all.detect {|n| n.name == input}
  end


  def find_or_create_by_name(input)
    if self.find_by_name(input) == nil
      self.create(input)
    else
      self.find_by_name(input)
    end
  end

end
