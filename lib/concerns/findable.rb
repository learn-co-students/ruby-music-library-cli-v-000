module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|item| item.name==name}
  end

  def find_or_create_by_name(name)
    res=self.find_by_name(name)
    if res==nil
      self.create(name)
    else
      res
    end
  end




end
