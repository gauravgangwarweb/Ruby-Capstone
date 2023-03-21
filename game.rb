require 'date'
require_relative './item'

class Game < Item
    attr_accessor :multiplayer, :last_played_at, :publish_date
    attr_reader :id

    def initialize(multiplayer, :last_played_at, :publish_date)
        super(id = Random.rand(1..1000))
        @id = id
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        @publish_date = publish_date
        @archived = can_be_archived?
    end

end