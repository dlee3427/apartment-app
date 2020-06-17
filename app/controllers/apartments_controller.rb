class ApartmentsController < ApplicationController
  # add controller methods
  set :views, "app/views/apartments"

  get '/apartments' do 
    @apartments = Apartment.all
    erb :index 
  end 

  get '/apartments/new' do
    erb :new  
  end

  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    erb :show
  end 

  post '/apartments' do 
    apartment = Apartment.create(params)
    redirect "/apartments/#{apartment.id}"
  end 

  delete '/apartments/:id' do
    Apartment.delete(params[:id])
    redirect '/apartments'
  end

  

  

end
