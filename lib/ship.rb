class Ship

    attr_reader :name,
                :health,
                :length
    def initialize(name, health)
        @name = name 
        @health = health
        @length = 3
    end
end