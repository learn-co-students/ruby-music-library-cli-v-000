module Concerns::Findable

##logic originally developed in Song class

  def find_by_name(name)

    ##there must be a cleaner way to do this
    self.all.detect do |x|
      x if x.name == name
    end
  end



  def find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end




end
