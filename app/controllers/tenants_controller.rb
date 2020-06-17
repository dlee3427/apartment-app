class TenantsController < ApplicationController
  # add controller methods
  set :views, "app/views/tenants"
  
  get '/tenants' do 
    @tenants = Tenant.all 
    erb :index 
  end 

  get '/tenants/:id' do
    @tenant = Tenant.find(params[:id])
    erb :edit 
  end

  patch '/tenants/:id' do
    tenant = Tenant.find(params[:id])
    tenant.update(name: params[:name])
    tenant.update(apartment_id: params[:apartment_id])
    redirect "/tenants/#{tenant.id}"
  end 

  


end
