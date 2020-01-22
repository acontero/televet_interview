require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  # before(:each) do
  #     @project  = create :project
  # end
  #
  # it 'does return '
  # post(:create, params: { book: { title: "Love Hina" }})
  #
  #   # Asserts that the controller tried to redirect us to
  #   # the created book's URI.
  #   assert_response :found

  describe 'GET #show' do
    it 'does show the pet with the given id' do
      get :show
      expect(response).to be_ok
    end
  end
end
