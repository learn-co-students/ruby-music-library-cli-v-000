module Bundler
  class BundlerError < StandardError
    def self.status_code(code)
      define_method(:status_code) { code }
    end
  end

  class GemfileNotFound < BundlerError; status_code(10); end
  class GemNotFound < BundlerError; status_code(7); end
  class GemfileError < BundlerError; status_code(4); end
  class InstallError < BundlerError; status_code(5); end
  class InstallHookError < BundlerError; status_code(8); end
  class PathError < BundlerError; status_code(13); end
  class GitError < BundlerError; status_code(11); end
  class DeprecatedError < BundlerError; status_code(12); end
  class GemspecError < BundlerError; status_code(14); end
  class InvalidOption < BundlerError; status_code(15); end
  class ProductionError < BundlerError; status_code(16); end
  class HTTPError < BundlerError; status_code(17); end
  class RubyVersionMismatch < BundlerError; status_code(18); end
  class SecurityError < BundlerError; status_code(19); end
  class LockfileError < BundlerError; status_code(20); end
  class CyclicDependencyError < BundlerError; status_code(21); end
  class GemfileLockNotFound < BundlerError; status_code(22); end
  class GemfileEvalError < GemfileError; end
  class MarshalError < StandardError; end

  # Internal errors, should be rescued
  class VersionConflict < BundlerError
    attr_reader :conflicts

    def initialize(conflicts, msg = nil)
      super(msg)
      @conflicts = conflicts
    end

    status_code(6)
  end

  class GemRequireError < BundlerError
    attr_reader :orig_exception

    def initialize(orig_exception, msg)
      super(msg)
      @orig_exception = orig_exception
    end

    status_code(24)
  end

  class PermissionError < BundlerError
    def initialize(path, permission_type = :write)
      @path = path
      @permission_type = permission_type
    end

    def message
      action = case @permission_type
               when :read then "read from"
               when :write then "write to"
               when :executable, :exec then "execute"
               else @permission_type.to_s
      end
      "There was an error while trying to #{action} `#{@path}`. " \
      "It is likely that you need to grant #{@permission_type} permissions " \
      "for that path."
    end

    status_code(23)
  end

  class YamlSyntaxError < BundlerError
    attr_reader :orig_exception

    def initialize(orig_exception, msg)
      super(msg)
      @orig_exception = orig_exception
    end

    status_code(25)
  end
end
