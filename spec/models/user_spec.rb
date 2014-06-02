require 'spec_helper'

describe User do
  describe '#auth_token_pair' do

    context "a new user is created" do
      let(:user) { User.new(email: "test@foo.com", password: "12345678") }
      let(:public_token) { user.auth_token_pair.public_token }

      before { user.save }

      it "should create a new token with each save" do
        user.auth_token_pair.public_token.should_not be_nil
      end

    end

  end

  describe '#find_by_public_token' do
    let(:user) { User.new(email: "test@foo.com", password: "12345678") }
    let(:public_token) { user.auth_token_pair.public_token }
    before { user.save }

    subject { User.find_by_public_token(public_token) }
    it { should eq user }

  end

end
