def user_inputs
  puts "Please enter all the items purchased separated by a comma"
  $items_bought = gets.chomp.split(',')

  if $items_bought.include?('milk')
    set_item("milk") 
  end
  if $items_bought.include?('bread')
   set_item( "bread")
  end 
  if $items_bought.include?('banana') 
   set_item("banana")
  end 

  if $items_bought.include?('apple') 
  set_item("apple")
  end
end


def set_item(item_name)
  qty = $items_bought.count(item_name)
  puts qty
  
end
user_inputs