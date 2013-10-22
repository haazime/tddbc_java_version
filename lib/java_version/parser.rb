class JavaVersion
  module Parser
    extend self

    def parse(string)
      string.to_s.scan(/^(.+?)(\d+?)(u)(\d+?)$/)
        .flatten
        .tap do |m|
          break {
            name: m[0],
            family_number: m[1],
            separator: m[2],
            update_number: m[3]
          }
        end
    end
  end
end
