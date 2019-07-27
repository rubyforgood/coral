shared_context "logged in" do 
    before do 
        @user = FactoryBot.create(:user)
        sign_in(@user)
    end
end