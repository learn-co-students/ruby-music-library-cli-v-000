module Concerns::Findable
  def find_by_name(name)
    if self.all.detect {|s| s.name == name} != nil
      return self.all.detect {|s| s.name == name}
    else
      return nil
    end
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      return self.find_by_name(name)
    end
  end

  def sort_all_by_name
    self.all.sort! {|a, b| a.name <=> b.name}
  end
end
