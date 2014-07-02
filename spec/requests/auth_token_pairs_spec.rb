require 'spec_helper'

describe 'AuthTokenPairs' do
  describe 'GET /auth_token_pairs/me' do
    it 'should return 302' do
      get auth_token_pairs_me_path
      expect(response.status).to be(302)
    end
  end

  describe 'when signed in' do
    let(:user) { User.create(email: 'test@foo.com', password:'12345678') }
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
