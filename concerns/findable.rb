module Findable

  def self.find_by_name(name)

    self.all.detect{|item| item.name = name}

  end

  def self.find_or_create_by_name(name)
    
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      self.create(name)
    end

  end

end