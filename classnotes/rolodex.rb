class Rolodex

  def initialize

    @contacts = []

  end

  def create_contact(name)

    contact = Contact.new
    contact.name = name
    @contacts << contact

  end

  def view_contacts

    @contacts.each {|contact| puts contact; puts "------------"}

  end

  def remove_contact(id)

    @contacts.delete_if {|contact| contact.id == id}

  end

  def edit_contact(id,name)

    @contacts.each {|contact|

      if contact.id == id
        contact.name = name
      end
    }

  end

end