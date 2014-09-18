require 'spec_helper'

describe AdminController do
  let!(:user) { FactoryGirl.create(:user) }

  describe("GET index") do
    context "when signed out" do
      before do
        get :index
      end
      it "should prevent access and redirect to the sign in path" do
        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when signed in" do
      before do
        sign_in user
        get :index
      end

      context "user is an administrator" do
        let(:user) { FactoryGirl.create(:admin_user) }
        it { expect(response.status).to eq(200) }
      end

      context "user is _not_ an administrator" do
        let(:user) { FactoryGirl.create(:user) }
        it("prevents unauthenticated users from accessing the admin") do
          expect(response.status).to eq(302)
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end
