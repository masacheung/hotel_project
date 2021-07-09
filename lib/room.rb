class Room
    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def full?
        @occupants.length == @capacity
    end

    def available_space
        num = @capacity - @occupants.length
    end

    def add_occupant(person_name)
        if !self.full?
            @occupants << person_name
            return true
        end
        false
    end
end
