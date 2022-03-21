require 'sinatra'
require_relative 'config'

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end

# ... (only showing relevant part of code)
get '/messages' do
  erb :message, locals: {
    name: 'GenerasiGIGIH',
    color: 'DodgerBlue'
  }
end
# ...


# ... (only showing relevant part of code)
get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
    "<h1 style=\"background-color:#{color};\">Hello #{name}!</h1>"
  erb :message, locals: {
    name: name,
    color: color
  }
end

# ... (only showing relevant part of code)
get '/login' do 
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged in!'
  else
    redirect '/login'
  end
end

get '/items/new' do 
  erb :create_items, locals: {
    error: false
  }
end

get '/items' do 
  name = params['name']
  category = params['category']
  price = params['price']
  erb :items, locals: {
    data: false,
    name: name,
    category: category,
    price: price
  }
end

post '/items' do
  message = ''
  name = params['name']
  category = params['category']
  price = params['price']
  
  if name == '' && category == '' && price == ''
    message = 'semua field harus terisi'
  elsif name == '' || category == '' || price == ''
    message = 'field harus terisi'
  else
    return erb :items, locals: {
    data: true,
    name: name,
    category: category,
    price: price
  }
  end
  erb :create_items, locals: {
    error: true,
    message: message
  }
end