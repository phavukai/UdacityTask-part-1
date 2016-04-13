require_relative 'todolist.rb'

# Creates a new todo list

todo = TodoList.new("New Todo List")

# Add four new items
todo.add_item("Testi1")
todo.add_item("Testi2")
todo.add_item("Testi3")
todo.add_item("Testi4")


# Print the list
todo.print_list
# Delete the first item
todo.delete_item(1)
# Print the list
todo.print_list
# Delete the second item
todo.delete_item(2)
# Print the list
todo.print_list
# Update the completion status of the first item to complete
todo.update_item(1,true)
# Print the list
todo.print_list
# Update the title of the list
todo.rename_list("New name")
# Print the list
todo.print_list
#Prioritize
todo.prioritize(2,+1)
todo.print_list
