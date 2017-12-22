class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.map { |line_item| line_item.item.price * line_item.quantity }.inject(:+)
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.update(quantity: (line_item.quantity + 1))
      line_item
    else
      line_item = self.line_items.new(item_id: item_id)
    end
  end

  def change_inventory
    update(status: "submitted")
    self.line_items.each do |line_item|
      line_item.item.update(inventory: (line_item.item.inventory -= line_item.quantity))
    end
  end
end
