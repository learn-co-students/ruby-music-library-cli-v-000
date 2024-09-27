module Concerns::Findable
  def find_by_name(name)
    all.detect{ |a| a.name == name }
  end

  def find_or_create_by_name(name)
    #find_by_name(name) || create(name)
        if self.find_by_name(name) != nil
          self.all.detect {|song| song.name == name}
        else
          self.create(name)
        end
  end
end
