require './contact'
require './rolodex'

class Runner

  def initialize

    @rolodex = Rolodex.new

  end

####################################### method to add a contact

  def add_contact

    puts "Please enter the first name"
    first_name = gets.chomp
    sleep(0.2)

    puts "Please enter the last name"
    last_name = gets.chomp
    sleep(0.2)

    puts "Please enter a valid email address"
    email = gets.chomp
    sleep(0.2)

    puts "Please enter any additional notes"
    notes = gets.chomp
    sleep(0.2)

    @rolodex.add_contact(first_name,last_name,email,notes)

    puts "Contact has been added."
    puts ""
    sleep (0.5)
  end

####################################### method to modify a contact

  def modify_contact

    puts "Enter the ID of the customer to modify."
    id = gets.chomp.to_i

    puts "Enter the attribute to modify. Your choices are First Name, Last Name, Email, Notes"
    attribute = gets.chomp

    puts "What would you like to change the #{attribute.downcase} to?"
    value = gets.chomp

    @rolodex.modify_contact(id,attribute,value)

    sleep(0.2)

    puts "Modification successful. \nPress 1 to make another modification. \nPress any other key to exit to the main screen "
    next_step = gets.chomp

    if next_step.to_i == 1

      self.modify_contact

    end

    sleep(0.2)

  end

####################################### method to view all contacts

  def view_all_contacts
    puts "--------------------------------"
    @rolodex.view_all_contacts

    puts ""

    sleep(0.2)

  end

####################################### method to view a specific contact

  def view_a_contact

    puts "Enter the ID of the contact you'd like to view"

    id = gets.chomp.to_i

    puts "--------------------------------"
    @rolodex.view_a_contact(id)
  end


####################################### method to view all contact with specific attribute value

  def view_all_by_attr_value

    puts "Which attribute would you like to filter by? Your choices are first name, last name, email or notes"
    attribute = gets.chomp
    sleep(0.2)

    puts "What is the attribute value would you like to filter for?"
    value = gets.chomp
    sleep(0.2)

    puts "--------------------------------"
    @rolodex.view_all_by_attr_value(attribute,value)

    sleep(0.2)

  end

####################################### method to delete a specific contact by ID

  def delete_a_contact

    puts "Which contact would you like to delete?"
    id = gets.chomp.to_i

    @rolodex.delete_a_contact(id)

    puts "Contact #{id} has been deleted!"
    puts ""

  end

####################################### method to delete all contacts that fit a criteria

  def delete_by_attr_value

    puts "Which attribute would you like to delete by? Your choices are first name, last name, email or notes"
    attribute = gets.chomp
    sleep(0.2)

    puts "What is the attribute value would you like to delete?"
    value = gets.chomp
    sleep(0.2)

    puts "Enter 1 to delete contacts with exact match; enter 2 to delete contacts that include the string."
    type = gets.chomp.to_i

    @rolodex.delete_by_attr_value(attribute,value,type)

    sleep(0.2)

  end

####################################### method to delete all contacts

  def delete_all_contacts

    puts "This will permanently delete all contacts entered. Are you sure you want to proceed? Enter Y to proceed and N to return to the main menu."

    decision = gets.chomp

    if decision == "Y"     
    @rolodex.delete_all_contacts
    end

  end


####################################### method for the user interface

  def run

    exit = false

    until exit == true do

      puts "You're now in the CRM system; please choose one of the following actions to perform:"
      puts "Press 1: Add a contact"
      puts "Press 2: Modify a contact"
      puts "Press 3: View all contacts"
      puts "Press 4: View a particular contact"
      puts "Press 5: View all contacts for a specific attribute value"
      puts "Press 6: Delete a contact"
      puts "Press 7: Delete all contacts for an attribute value"
      puts "Press 8: Delete all contacts"
      puts "Press 0: Exit the program"
      puts ""

      input = gets.chomp.to_i

      if input == 1
        add_contact
      elsif input == 2
        modify_contact
      elsif input == 3
        view_all_contacts
      elsif input == 4
        view_a_contact
      elsif input == 5
        view_all_by_attr_value
      elsif input == 6
        delete_a_contact
      elsif input == 7
        delete_by_attr_value
      elsif input == 8
        delete_all_contacts
      elsif input == 0
        sleep(0.2)
        puts "Goodbye!"
        exit = true
      else 
        puts "Invalid entry"

      end
    end
  end
end


runner = Runner.new

runner.run
