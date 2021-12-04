require 'pry'
# Item available in the shop
$items_details = {
      "milk" => {  
        unit_price: 3.97, 
        sale_on_quantity: 2,
        sale_unit_price: 2.50, 
      },
      "bread" => { 
        unit_price: 2.17, 
        sale_on_quantity: 3,
        sale_unit_price: 2.0
      }, 
      "apple" => { 
        unit_price: 0.89
      },
      "banana" => { 
        unit_price: 0.99 
      },
      "butter" => {
        unit_price: 2.10,
        sale_on_quantity:2,
        sale_unit_price: 1.05 
      },
      "mango" => {
        unit_price: 10.0,
        sale_on_quantity: 4,
        sale_unit_price: 8.0
      }
    }

class Item
  attr_accessor :item_name, :item_quantity, :item_discounted_price, :item_acutal_price
  def initialize(item_name, item_quantity)
    @item_name = item_name
    @item_quantity = item_quantity
    @item_discounted_price = calculate_item_discounted_price
    @item_acutal_price = calculate_item_acutal_price  
  end
  
  def calculate_item_discounted_price
    if $items_details[@item_name].has_key?(:sale_unit_price)
      sale_on_quantity = $items_details[@item_name][:sale_on_quantity]
      final_item_price = discount_calculator($items_details[@item_name][:unit_price], $items_details[@item_name][:sale_unit_price],sale_on_quantity)
      return final_item_price
    else 
      return $items_details[@item_name][:unit_price] * @item_quantity
    end 
  end

  def calculate_item_acutal_price
    return $items_details[@item_name][:unit_price] * @item_quantity
  end

  def discount_calculator(item_unit_price, item_sale_unit_price, sale_on_quantity)
    item_discounted_price = 0 
    if @item_quantity < sale_on_quantity
      item_discounted_price = item_unit_price * @item_quantity
      return item_discounted_price
    end
    if @item_quantity >= sale_on_quantity
      item_discounted_price = ((item_sale_unit_price * sale_on_quantity) * (@item_quantity / sale_on_quantity) ) + (item_unit_price * (@item_quantity % sale_on_quantity))
      return item_discounted_price
    end
  end
end