module Concerns::Memorable

  module ClassMethods

     ## clears all instances from @@all array
     def destroy_all
       self.all.clear
     end #self.destroy_all (clear) (reset)

     ## creates an instance and saves it
     def create(name)
       self.new(name).save
     end # self.create

   end # Classmethods

######################################################
# INSTANCE METHODS
######################################################


  module InstanceMethods

    ## saves the instance to the @@all array
    def save
      self.class.all << self
      self
    end # save
    
  end # InstanceMethods



end # module Concerns::Persistable
