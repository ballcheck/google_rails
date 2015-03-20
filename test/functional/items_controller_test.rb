require_relative "../test_helper"

class ItemsControllerTest < ActionController::TestCase

  # TODO: test success / error flash

  def test_index_assigns_items
    # Given
    items = [
      given_an_item_exists,
      given_an_item_exists,
      given_an_item_exists
    ]

    # When
    get :index

    # Then
    assert_equal items, assigns( :items )
  end

  def test_index_renders_view_succesfully
    # Given / # When
    get :index

    # Then
    assert_response :success
    assert_template "index"
  end

  def test_index_render_item_partial
    # Given
    items = [
      given_an_item_exists,
      given_an_item_exists,
      given_an_item_exists
    ]

    # When
    get :index

    # Then
    assert_response :success
    assert_template :partial => "_item", :count => 3
  end

  def test_create_item
    # Given
    uri = given_a_random_string
    body = given_a_random_string
    item = { :uri => uri, :body => body }

    # we dont want to hit google in tests
    ReallyUseful.stubs( :really_useful_method2 ).returns( item )

    # When / # Then
    assert_difference( "Item.count", 1 ) do
      get :create
    end

    # Then
    new_item = Item.last
    assert_equal uri, new_item.uri
    assert_equal body, new_item.body

    assert :success
    assert_redirected_to :action => :index
  end

end
