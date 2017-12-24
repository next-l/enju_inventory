module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin)
    end
  end

  def login_librarian
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:librarian)
      sign_in user
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def login_fixture_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = users(:admin)
      sign_in @user
    end
  end

  def login_fixture_librarian
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = users(:librarian1)
      sign_in @user
    end
  end

  def login_fixture_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = users(:user1)
      sign_in @user
    end
  end
end
