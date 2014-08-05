require 'spec_helper'

describe 'AuthTokenPairs' do

  let!(:user) { User.create(email: 'test@foo.com', password:'12345678') }

  describe 'GET /auth_token_pairs/me' do

    before { get auth_token_pairs_me_path }

    it 'should redirect me to sign in' do
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should should send me back after signing in' do
      post user_session_path, {'user[email]' => 'test@foo.com', 'user[password]' => '12345678'}
      expect(response).to redirect_to(auth_token_pairs_me_path)
    end

  end

  describe 'when signed in' do
    let(:public_token) { user.public_token }

    before do
      sign_in user
    end

    it 'includes the public token' do
      get auth_token_pairs_me_path
      expect(response.status).to be(200)
      expect(response.body).to include(public_token)
    end
  end

end
