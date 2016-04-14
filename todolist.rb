

class TodoList
    # methods and stuff go here

	attr_reader :title, :items




def initialize(list)
	@title=list;
	@items= Array.new;
end



def rename_list(title)
	@title=title
end

def add_item(new_item)

	item =  Item.new(new_item)
	@items.push(item)
end

def print_list

	puts @title
	puts "---------------------------------"
	
	counter = 1;

	@items.each do |item|
		puts "#{counter.to_s} #{item.description}  completion status: #{item.completed_status.to_s}";
		counter +=1;
	end 

end


def save_file
	counter = 1;
	time  = Time.now.strftime("%d/%m/%Y")
	report_file_puts ""
	report_file_puts  "Title of saved TodoList: #{@title}"
	report_file_puts "Save time: #{time}"
	report_file_puts "----------------------------"
		@items.each do |item|

		report_file_puts "#{counter.to_s} #{item.description} Completion status: #{item.completed_status.to_s}"
		counter +=1;	
	end	
end

def update_item_description(item_description,old_description)

        @items.each do |item|
            if item.item_description_equals?((old_description))
                item.description = item_description

            end
        end

    end


def report_file_puts(line)

	File.open("./report.txt", "a") do |file|
		file.puts line
	end
end


def delete_item(position)
    	#since array are zero based datastructures we rest 1 to the position
    	position -=1
    	@items.delete_at(position);
    
    end

def update_item(position,status)

	position -=1
	@items[position].update_status(status)
end

def prioritize(index, position = 1)
	@items.insert(position-1, @items.delete_at(index.to_i-1))
	@items[position.to_i-1]
		
end
end

class Item
    # methods and stuff go here

  # methods and stuff go here
  	attr_accessor  :completed_status, :description

    def initialize(item_description)
    	
	@description=item_description;
    	@completed_status = false
    end



def update_status(status)

  		@completed_status = status.to_s
  		puts "-> Item status updated"
  	end



  	def item_description_equals?(description)
	  	if @description.eql?(description);
	  		return true;
	  	else
	  		return false;
	  	end
  	end

end


