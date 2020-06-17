class TenantsController < ApplicationController
  # add controller methods
  set :views, "app/views/tenants"
  
  get '/tenants' do 
    @tenants = Tenant.all 
    erb :index 
  end 

  get '/tenants/new' do
    @apartments = Apartment.all 
    erb :new 
  end 

  get '/tenants/:id/edit' do
    @tenant = Tenant.find(params[:id])
    @apartments = Apartment.all
    erb :edit 
  end

  get '/tenants/:id' do 
    @tenant = Tenant.find(params[:id])
    erb :show
  end 


  patch '/tenants/:id' do
    tenant = Tenant.find(params[:id])
    tenant.update(name: params[:name])
    # binding.pry
    tenant.update(apartment_id: params[:tenant][:apartment_id])
    redirect "/tenants"
  end 


  delete '/tenants/:id' do 
    Tenant.delete(params[:id])
    redirect '/tenants'
  end 

  post '/tenants' do
    tenant = Tenant.new(name: params[:name])
    # tenant.update(name: params[:name])

    tenant.apartment_id=(params[:tenant][:apartment_id])
    tenant.save
    
    redirect '/tenants'
  end 

end
