require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each {|room_name, capacity| @rooms[room_name] = Room.new(capacity)}
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            p "sorry, room does not exist"
            return false
        end

        if @rooms[room_name].add_occupant(person)
            p "check in successful" 
            return true
        else
            p "sorry, room is full"
            return false
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full?}
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts room_name + " : " + room.available_space.to_s
        end
    end
end
