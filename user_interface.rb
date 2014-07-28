require './lib/task'
require './lib/list'

@master_list = []
@selected_list
@current_list

def main_menu
  loop do
    puts "Please press 'l' to list all of your lists or 'n' to add a list or 's' to select list"
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'n'
      add_list
    elsif main_choice == 'l'
      if @master_list.length == 0
        puts "Please make a list first"
        main_menu
      else
        list_lists
      end
    elsif main_choice == 's'
      main_menu_for_lists
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def main_menu_for_lists
  list_lists
  select_list
  puts "Press 'a' to add a task"
  puts "Press 'l' to list tasks"
  puts "Please press 'o' to return to the main menu"
  puts "Press 'x' to exit."
  list_menu_choice = gets.chomp
  if list_menu_choice == 'a'
    add_task
  elsif list_menu_choice == 'l'
    list_tasks(@current_list)
  elsif list_menu_choice == 'o'
    main_menu
  elsif list_menu_choice == 'x'
    puts "Good-bye!"
    exit
  else
    puts "Sorry, that wasn't a valid option."
  end

end


def main_menu_for_tasks
  loop do
    puts "Please press 'l' to list all of your tasks or 'n' to add a task"
    puts "Please press 'o' to return to the main menu"
    puts "Press 'x' to exit."
    second_choice = gets.chomp
    if second_choice == 'l'
      list_tasks(@current_list)
    elsif second_choice == 'n'
      add_task
    elsif second_choice == 'o'
      main_menu
    elsif second_choice == 'x'
      puts "Good-bye"
      exit
    else
      put "Sorry, that wasn't a valid option."
    end
  end
end

# ----------------------

def add_list
  puts "Enter the name of your list"
  list_name = gets.chomp
  @master_list << List.new(list_name)
  puts "List added.\n\n"
end

def list_lists
  puts "Here are all of your lists:"
  @master_list.each do |list|
    puts list.name
  end
  puts "\n"
end

def select_list
  puts "To add tasks to a specifc list, type the name of the list"
  @selected_list = gets.chomp
  @master_list.each do |list|
    if list.name == @selected_list
      @current_list = list
    end
  end
  puts "Selected list: #{@current_list.name}"
end
# ----------------------

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  new_task = Task.new(user_description)
  @current_list.add_task(new_task)
  puts "Task added.\n\n"
end

def list_tasks(list)
  puts "Here are all of your tasks:"
  list.task_list.each do |task|
    puts task.description
  end
  puts "\n"
end

main_menu
