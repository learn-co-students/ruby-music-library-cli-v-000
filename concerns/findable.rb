module Findable
  extend Concerns
  def find_by_name(name)
    self.all.detect {|o| o.name == name}
  end

  def find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result == nil
      self.new(name)
    else
      result
    end
  end
end
