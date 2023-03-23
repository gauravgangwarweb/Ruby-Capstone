require './item'
require 'date'

class Genre < Item
  def initialize(name, publish_date)
    super(id = Random.rand(1..100))
    @id = id
    @name = name
    @publish_date = publish_date
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  attr_accessor :name, :items
  attr_reader :id, :publish_date
end
