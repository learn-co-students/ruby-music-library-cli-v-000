require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

class AssociationTypeMismatchError < TypeError; end
class AlreadyExistsError < StandardError; end
