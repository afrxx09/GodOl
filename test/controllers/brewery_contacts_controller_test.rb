require 'test_helper'

class BreweryContactsControllerTest < ActionController::TestCase
  setup do
    @brewery_contact = brewery_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brewery_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brewery_contact" do
    assert_difference('BreweryContact.count') do
      post :create, brewery_contact: { brewery_contact: @brewery_contact.brewery_contact, brewery_id: @brewery_contact.brewery_id, contact_type_id: @brewery_contact.contact_type_id }
    end

    assert_redirected_to brewery_contact_path(assigns(:brewery_contact))
  end

  test "should show brewery_contact" do
    get :show, id: @brewery_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brewery_contact
    assert_response :success
  end

  test "should update brewery_contact" do
    patch :update, id: @brewery_contact, brewery_contact: { brewery_contact: @brewery_contact.brewery_contact, brewery_id: @brewery_contact.brewery_id, contact_type_id: @brewery_contact.contact_type_id }
    assert_redirected_to brewery_contact_path(assigns(:brewery_contact))
  end

  test "should destroy brewery_contact" do
    assert_difference('BreweryContact.count', -1) do
      delete :destroy, id: @brewery_contact
    end

    assert_redirected_to brewery_contacts_path
  end
end
