gem 'activerecord' ,'=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'contacts.sqlite3')

class Contact < ActiveRecord::Base
  field :first_name, as: :string
  field :last_name, as: :string
  field :email, as: :string
  field :number, as: :integer
  field :note, as: :text

  def full_name
    "#{ first_name } #{ last_name }"

  end
end

  Contact.auto_upgrade!
# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com','416-967-1111', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com','416-967-1111', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com','416-967-1111', 'Visionary')
