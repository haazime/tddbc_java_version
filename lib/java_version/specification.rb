class JavaVersion
  module Specification
    extend self

    @@regexp = /^jdk(\d+)u((?:\d)|(?:[1-9][0-9]+))$/i

    def satisfied_by?(candidate)
      @@regexp =~ candidate ? true : false
    end

    def extract_family_number(string)
      version_numbers(string, 1).to_i
    end

    def extract_update_number(string)
      version_numbers(string, 2).to_i
    end

  private

    def version_numbers(string, matched_number)
      string[@@regexp, matched_number]
    end
  end
end
