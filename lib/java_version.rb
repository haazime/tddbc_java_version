require 'java_version/core_ext/string'

class JavaVersion
  autoload :UpdateNumber,         'java_version/update_number'
  autoload :LimitedUpdate,        'java_version/updates/limited_update'
  autoload :CriticalPatchUpdate,  'java_version/updates/critical_patch_update'
  autoload :SecurityAlert,        'java_version/updates/security_alert'
end


class JavaVersion
  include Comparable

  class << self

    def valid?(string)
      return false unless string.java_version?
      true
    end

    def parse(string)
      return raise_error unless valid?(string)
      create(string)
    end

  private

    def create(string)
      new(string.family_number, UpdateNumber.new(string.update_number))
    end

    def raise_error(string)
      raise ArgumentError.new("invalid version `#{string}`")
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
      @update_number.version_up(update)
    )
  end
end
