class JavaVersion
  module LimitedUpdate

    def self.next_number(current)
      20 * (current / 20 + 1)
    end
  end

  module CriticalPatchUpdate

    def self.next_number(current)
      (5 * (current / 5 + 1)).tap do |x|
        break x + 1 if x % 2 == 0
      end
    end
  end

  module SecurityAlert

    def self.next_number(current)
      (current + 1).tap do |x|
        break x + 2 if x % 20 == 0 and x % 5 == 0
        break x + 1 if x % 5 == 0
      end
    end
  end
end

class JavaVersion
  class UpdateNumber
    include Comparable

    def initialize(number)
      @number = number
    end

    def version_up(update)
      self.class.new(update.next_number(self))
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

    def +(n)
      self.to_i + n
    end

    def /(n)
      self.to_i / n
    end

    def to_i
      @number
    end

    def <=>(other)
      self.to_i <=> other.to_i
    end
  end
end
