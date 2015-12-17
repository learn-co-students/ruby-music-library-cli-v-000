module Concerns

  module Create_Destroy
    def create(name)  # self is the class
      instance = self.new(name)  # self is the class; creates a new instance and stores in variable
      instance.save  # calls the save method on the instance
      instance  # returns instance
    end

    def destroy_all  # self is the class
      self.all.clear  # calls clear on the @@all array
    end
  end

end