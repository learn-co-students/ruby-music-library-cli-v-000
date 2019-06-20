module Concerns::Findable

  def find_by_name(name)
all.detect {|a| a.name == name}
 end

  def find_or_create_by_name(name)
    new = find_by_name(name)
    if all.include?(new)
      new
    else
      create(name)
    end


  end




end
