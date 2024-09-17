module Concerns::Findable
  def find_by_name(name)
    all.detect{|item| item.name==name}
  end
  
  def find_or_create_by_name(name)
      unless self.find_by_name(name) == nil
        find_by_name(name)
      else
        create(name)
      end
  end
end