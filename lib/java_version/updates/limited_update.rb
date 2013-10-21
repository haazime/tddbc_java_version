class JavaVersion
  module LimitedUpdate

    def self.next_update_number(current)
      20 * (current / 20 + 1)
    end
  end
end
