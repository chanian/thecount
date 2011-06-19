module TheCount
  class Countable
    attr_reader :unit, :value, :service_name

    def count(url)
      raise "This countable object must have a count strategy implemented"
    end
  end
end
