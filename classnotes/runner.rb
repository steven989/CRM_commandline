require './rolodex'
require './contact'

class Runner

  def initialize

    @rolodex = Rolodex.new

  end


  def main_menu

    puts "Amazing CRM"
    puts "1. Add a contact"
    puts "2. See all contacts"
    puts "3. Remove a contact"
    puts "4. Edit a contact"
    puts "0. To Exit"


  end



  def add_contact

    puts "Enter Customer's Name"
    name = gets.chomp
    @rolodex.create_contact(name)

  end


  def view_contacts

    puts "All Cntacts"
    @rolodex.view_contacts

  end

  def edit_contact

    puts "Enter contact's ID to edit it"

    id = gets.chomp.to_i

    puts "Enter new contact name"

    name = gets.chomp

    @rolodex.edit_contact(id,name)

  end

  def remove_contact

    puts "Enter contact's ID to remove it"

    id = gets.chomp.to_i

    @rolodex.remove_contact(id)

  end


  def run

    done = false

    while !done

    main_menu
    input = gets.chomp.to_i

      if input == 0 
        done = true
      elsif input == 1
        add_contact
      elsif input == 2
        view_contacts
      elsif input == 3
        remove_contact
      elsif input == 4
        edit_contact
      end
    end

  end

end 


runner = Runner.new
runner.run