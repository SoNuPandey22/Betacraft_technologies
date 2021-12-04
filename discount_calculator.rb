require_relative './item.rb'
require 'terminal-table'
require 'pry'



module My_shop
  # item details containers
  $discounted_price = []
  $input_item = []
  $final_bill = []
  $total_actual_price = []

  def get_item
    puts "Please enter all the items purchased separated by a comma"
    $input_item = gets.chomp.split(',')
    $items_details.each do |item_name , price_scheme|
      if $input_item.include?(item_name)
        set_item(item_name)
      end
    end
    
    print_bill
  end

  def set_item(item_name)
    qty = $input_item.count(item_name)
    item = Item.new(item_name, qty)
    $final_bill << [item.item_name, item.item_quantity, "$#{item.item_discounted_price}"]
    $discounted_price.push(item.item_discounted_price)
    $total_actual_price.push(item.item_acutal_price)
  end

  def print_bill 
    table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $final_bill
    puts table
    print_receipt
  end

  def print_receipt
    amount_saved = ($total_actual_price.sum - $discounted_price.sum).round(2)
    puts"\n Total price: $#{ $discounted_price.sum.round(2)} \n You saved $#{amount_saved} today."
  end

end 



class Shop
  include My_shop 
end

# Shop object

p = Shop.new
p.get_item