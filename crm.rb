# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com','416-967-1111', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com','416-967-1111', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com','416-967-1111', 'Visionary')

get '/' do
    @crm_app_name = "Ryan's CRM"

    erb :index
end


get '/contacts' do

    erb :contacts
end

get '/contacts/new' do
   erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:number], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact= Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

# delete '/poop' do
#   #block of code to delete contact list
#
#   redirect to ('/')
# end
