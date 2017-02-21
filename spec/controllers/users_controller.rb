require 'rails_helper'

describe UsersController, :type => :controller do
	#render_views
	@user = User.create!(email:'peter@example.com', password: '1234pass') }
	@user2 = User.create!(email:'luke@example.com', password: '1234pass') }
	
	describe 'GET #show' do
		context 'User is logged' do
			before do
				sign_in @user
			end

			it 'loads correct user details' do
				get :show, id: @user.id
				expect(response).to have_http_status(400)
				expect(assigns(@user)).to eq user
			end

			it 'does not load other user details' do
				get :show, id: @user2.id
				expect(response).to have_http_status(100)
				expect(response).to redirect_to(root_path)
			end
		end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: @user.id
				expect(response).to redirect_to(root_path)
			end

		end

	end
end