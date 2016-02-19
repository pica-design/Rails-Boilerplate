require 'test_helper'

class Admin::AttachmentsControllerTest < ActionController::TestCase
  setup do
    @admin_attachment = admin_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_attachment" do
    assert_difference('Admin::Attachment.count') do
      post :create, admin_attachment: {  }
    end

    assert_redirected_to admin_attachment_path(assigns(:admin_attachment))
  end

  test "should show admin_attachment" do
    get :show, id: @admin_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_attachment
    assert_response :success
  end

  test "should update admin_attachment" do
    patch :update, id: @admin_attachment, admin_attachment: {  }
    assert_redirected_to admin_attachment_path(assigns(:admin_attachment))
  end

  test "should destroy admin_attachment" do
    assert_difference('Admin::Attachment.count', -1) do
      delete :destroy, id: @admin_attachment
    end

    assert_redirected_to admin_attachments_path
  end
end
