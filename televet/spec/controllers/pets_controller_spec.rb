require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  # Could mock objects using something like FactoryGirl gem:
  # before(:each) do
  #     @project  = create :project
  # end

  describe 'GET #index' do
    it 'does show a paginated list of pets' do
      get :index, params: {page: 1}
        expect(response).to have_http_status(:success)
        payload = JSON.parse(response.body)
        #puts payload
        size = payload["pets"].size
        expect(size) == 10
    end

    it 'does show a empty list of pets when page is out of range' do
      get :index, params: {page: 17}
        expect(response).to have_http_status(:success)
        payload = JSON.parse(response.body)
        puts payload
        size = payload["pets"].size
        expect(size) == 0
    end
  end

  describe 'GET #show' do
    it 'does SHOW the pet with the given id' do
      get :show, params: {id: 1}
        expect(response).to have_http_status(:success)
    end

    it 'does return 404 when pet with given id is not found' do
      get :show, params: {id: 150}
        expect(response).to have_http_status(:not_found)
    end
  end
end
