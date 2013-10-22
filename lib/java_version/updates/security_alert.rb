class JavaVersion
  module SecurityAlert
    extend self

    def next_update_number(current)
      (current + 1).tap do |x|
        break x + 1 if x % 20 == 0
      end
    end
  end
end

