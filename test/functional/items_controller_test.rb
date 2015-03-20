require_relative "../test_helper"

class ItemsControllerTest < ActionController::TestCase

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

end
