require 'rails_helper'

RSpec.describe HomesController, type: :controller do

end

RSpec.describe 'home routes', type: :routing do
  before(:each) do
    @home = Home.create({ name: 'Home', latitude: 0, longitude: 0 })
  end

  it 'routes /homes/index to the homes controller' do
    expect(get(homes_path)).to route_to(:controller => 'homes', :action => 'index')
  end

  it 'routes /homes/new to the homes controller' do
    expect(get(new_home_path)).to route_to(:controller => 'homes', :action => 'new')
  end

  it 'routes /homes/create to the homes controller' do
    expect(post(homes)).to rout_to(:controller => 'homes', :action => 'create')
  end



end

  