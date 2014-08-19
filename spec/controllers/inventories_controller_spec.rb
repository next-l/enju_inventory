require 'spec_helper'

describe InventoriesController do
  fixtures :all

  describe "GET index" do
    describe "When logged in as Administrator" do
      login_fixture_admin

      it "assigns all inventories as @inventories" do
        get :index
        expect(assigns(:inventories)).to eq(Inventory.page(1))
        expect(response).to be_success
      end
    end

    describe "When logged in as Librarian" do
      login_fixture_librarian

      it "assigns all inventories as @inventories" do
        get :index
        expect(assigns(:inventories)).to eq(Inventory.page(1))
        expect(response).to be_success
      end
    end

    describe "When logged in as User" do
      login_fixture_user

      it "assigns all empty as @inventories" do
        get :index
        expect(assigns(:inventories)).to be_empty
        expect(response).to be_forbidden
      end
    end

    describe "When not logged in" do
      it "assigns all inventories as @inventories" do
        get :index
        expect(assigns(:inventories)).to be_empty
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET show" do
    describe "When logged in as Administrator" do
      login_fixture_admin

      it "assigns the requested inventory as @inventory" do
        get :show, :id => 1
        expect(assigns(:inventory)).to eq(Inventory.find(1))
        expect(response).to be_success
      end
    end

    describe "When logged in as Librarian" do
      login_fixture_librarian

      it "assigns the requested inventory as @inventory" do
        get :show, :id => 1
        expect(assigns(:inventory)).to eq(Inventory.find(1))
        expect(response).to be_success
      end
    end

    describe "When logged in as User" do
      login_fixture_user

      it "assigns the requested inventory as @inventory" do
        get :show, :id => 1
        expect(assigns(:inventory)).to eq(Inventory.find(1))
        expect(response).to be_forbidden
      end
    end

    describe "When not logged in" do
      it "assigns the requested inventory as @inventory" do
        get :show, :id => 1
        expect(assigns(:inventory)).to eq(Inventory.find(1))
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET new" do
    describe "When logged in as Administrator" do
      login_fixture_admin

      it "assigns the requested inventory as @inventory" do
        get :new
        expect(assigns(:inventory)).not_to be_valid
        expect(response).to be_success
      end
    end

    describe "When logged in as Librarian" do
      login_fixture_librarian

      it "should not assign the requested inventory as @inventory" do
        get :new
        expect(assigns(:inventory)).not_to be_valid
        expect(response).to be_success
      end
    end

    describe "When logged in as User" do
      login_fixture_user

      it "should not assign the requested inventory as @inventory" do
        get :new
        expect(assigns(:inventory)).not_to be_valid
        expect(response).to be_forbidden
      end
    end

    describe "When not logged in" do
      it "should not assign the requested inventory as @inventory" do
        get :new
        expect(assigns(:inventory)).not_to be_valid
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET edit" do
    describe "When logged in as Administrator" do
      login_fixture_admin

      it "assigns the requested inventory as @inventory" do
        inventory = inventories(:inventory_00001)
        get :edit, :id => inventory.id
        expect(assigns(:inventory)).to eq(inventory)
      end
    end

    describe "When logged in as Librarian" do
      login_fixture_librarian

      it "assigns the requested inventory as @inventory" do
        inventory = inventories(:inventory_00001)
        get :edit, :id => inventory.id
        expect(assigns(:inventory)).to eq(inventory)
      end
    end

    describe "When logged in as User" do
      login_fixture_user

      it "assigns the requested inventory as @inventory" do
        inventory = inventories(:inventory_00001)
        get :edit, :id => inventory.id
        expect(response).to be_forbidden
      end
    end

    describe "When not logged in" do
      it "should not assign the requested inventory as @inventory" do
        inventory = inventories(:inventory_00001)
        get :edit, :id => inventory.id
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end
