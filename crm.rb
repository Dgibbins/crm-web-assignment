# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com','416-967-1111', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com','416-967-1111', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com','416-967-1111', 'Visionary')

get '/' do


    erb :index
end


get '/contacts' do
    erb :contacts
end

get '/contacts/new' do
   erb :new_contact
end

post '/contacts' do
  @contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    number:     params[:number],
    email:      params[:email],
    note:       params[:note]
  )
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

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(first_name:  params[:first_name])
    @contact.update(last_name:   params[:last_name])
    @contact.update(number:      params[:number])
    @contact.update(email:       params[:email])
    @contact.update(note:        params[:note])

    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to ('/')
  else
    raise Sinatra::NotFound
  end
end


get '/about' do

    erb :about

  end

  after do
    ActiveRecord::Base.connection.close
  end
