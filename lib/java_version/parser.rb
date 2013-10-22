class JavaVersion
  class Parser

    def initialize(specification)
      @specification = specification
    end

    def parse(string)
      {
        family_number: family_number(string),
        update_number: update_number(string)
      }
    end

  private

    def family_number(string)
      @specification.extract_family_number(string)
    end

    def update_number(string)
      @specification.extract_update_number(string)
    end
  end
end
