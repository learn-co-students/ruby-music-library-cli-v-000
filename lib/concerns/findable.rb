module Concerns::Findable
  # Module code here
  def find_by_name(name)
    self.all.detect {|x| x.name.downcase == name.downcase}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
