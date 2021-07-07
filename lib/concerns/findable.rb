module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|a| a.name == name}
  end
  def find_or_create_by_name(name)
    match = self.find_by_name(name)
    if match != nil
      return match
    end
    self.create(name)
  end
end
