module Concerns::Findable

  def find_by_name(name)
    self.all.find{|instance| instance.name == name}
  end

  def find_or_create_by_name(name)
    instance = self.find_by_name(name)
    instance = self.create(name) if instance.nil?
    instance
  end

end
#
# module Concerns
# 	module Findable
# 		def find_by_name(song)
# 			all.find {|f| f.name == song}
# 		end
#
# 		def find_or_create_by_name(song)
# 			unless (all.find {|f| f.name == song})
# 				self.create(song)
# 			end
# 			all.find {|f| f.name == song}
# 		end
#
# 	end
# end
#
#
# module Findable
#
#     def find_by_name(name)
#         self.all.detect{|o| o.name == name} # Got this from Avi's lecture video. Research why .detect and not .find
#     end
#
# end
