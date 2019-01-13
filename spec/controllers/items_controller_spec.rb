require 'rails_helper'

describe ItemsController do
  fixtures :all

  def valid_attributes
    FactoryBot.attributes_for(:item)
  end

  describe 'GET index', solr: true do
    before do
      Item.reindex
    end

    describe 'When logged in as Librarian' do
      login_fixture_librarian

      it 'should not get index with inventory_file_id' do
        get :index, params: { inventory_file_id: 1 }
        expect(response).to be_successful
        assigns(:inventory_file).should eq InventoryFile.find(1)
        expect(assigns(:items)).to eq Item.inventory_items(assigns(:inventory_file), 'not_on_shelf').order('items.id').page(1)
      end
    end

    describe 'When logged in as User' do
      login_fixture_user

      it 'should not get index with inventory_file_id' do
        get :index, params: { inventory_file_id: 1 }
        expect(response).to be_forbidden
      end
    end

    describe 'When not logged in' do

      it 'should not get index with inventory_file_id' do
        get :index, params: { inventory_file_id: 1 }
        expect(response).to redirect_to new_user_session_url
        assigns(:inventory_file).should_not be_nil
      end
    end
  end

end
