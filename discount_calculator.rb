require_relative './item.rb'


# declaring variables for the storing the data
$discounted_price = []
$input_item = []
$final_bill = []
$total_actual_price = []

def get_item
  puts "Please enter all the items purchased separated by a comma"
  $input_item = gets.chomp.split(',')

  if $input_item.include?('milk')
    set_item("milk") 
  end
  if $input_item.include?('bread')
   set_item( "bread")
  end 
  if $input_item.include?('banana') 
   set_item("banana")
  end 

  if $input_item.include?('apple') 
  set_item("apple")
  end

  
  print_receipt
end

def set_item(item_name)
  qty = $input_item.count(item_name)
  item = Item.new(item_name, qty)
  $final_bill << [item.item_name, item.item_quantity, "$#{item.item_discounted_price}"]
  $discounted_price.push(item.item_discounted_price)
  $total_actual_price.push(item.item_acutal_price)
end

def print_receipt
  amount_saved = ($total_actual_price.sum - $discounted_price.sum).round(2)
  puts"\n Total price: $#{ $discounted_price.sum.round(2)} \n You saved $#{amount_saved} today."
end

get_item
