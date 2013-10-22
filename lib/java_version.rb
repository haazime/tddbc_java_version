class JavaVersion
  autoload :Specification,        'java_version/specification'
  autoload :Parser,               'java_version/parser'
  autoload :LimitedUpdate,        'java_version/updates/limited_update'
  autoload :CriticalPatchUpdate,  'java_version/updates/critical_patch_update'
  autoload :SecurityAlert,        'java_version/updates/security_alert'
end

class JavaVersion
  include Comparable

  class << self

    def valid?(string)
      parse(string)
    rescue ArgumentError
      false
    else
      true
    end

    def parse(string)
      version = Parser.parse(string)
      if Specification.satisfied_by?(version)
        create(version)
      else
        raise parse_error(string)
      end
    end

  private

    def create(version)
      new(version[:family_number].to_i, version[:update_number].to_i)
    end

    def parse_error(string)
      ArgumentError.new("Invalid java version string `#{string}`")
    end
  end

  attr_reader :family_number, :update_number

  def initialize(family_number, update_number)
    @family_number = family_number
    @update_number = update_number
  end

  def next_limited_update
    version_up(LimitedUpdate)
  end

  def next_critical_patch_update
    version_up(CriticalPatchUpdate)
  end

  def next_security_alert
    version_up(SecurityAlert)
  end

  def <=>(other)
    (self.family_number <=> other.family_number).tap do |x|
      break self.update_number <=> other.update_number if x == 0
    end
  end

private

  def version_up(update)
    self.class.new(
      @family_number,
      update.next_update_number(@update_number)
    )
  end
end
