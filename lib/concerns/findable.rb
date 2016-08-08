require 'pry'
module Concerns::Findable

  def find_by_name(name)
    # result = nil
    # self.all.each do |x|
    #   if x.name == name
    #     result = x
    #   end
    # end
    # result

    result = self.all.select{|x| x.name == name}
    result[0]

  end

  def find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      self.create(name)
    end
  end

end
