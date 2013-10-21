class JavaVersion
  class UpdateNumber
    include Comparable

    def initialize(number)
      @number = number
    end

    def version_up(update)
      self.class.new(update.next_number(self))
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
