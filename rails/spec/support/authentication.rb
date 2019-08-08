shared_context "logged in" do
  let(:current_user) { FactoryBot.create(:user) }
  before do
    sign_in(current_user)
  end
end
