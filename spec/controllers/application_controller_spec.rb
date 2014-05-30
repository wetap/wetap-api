require 'spec_helper'

describe ApplicationController do

  describe "#after_sign_in_path_for" do
    subject { controller.after_sign_in_path_for(user) }

    context "when admin users are signing in" do
      let(:user){ User.new({admin: true}) }
      it { should eq(admin_root_path) }
    end

    context 'when regular users are signing in' do
      let(:user){ User.new }
      it { should eq(water_fountains_after_login_path) }
    end
  end
end
