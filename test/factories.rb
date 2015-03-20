module Factories

  def given_a_random_string( length = 10 )
    SecureRandom.urlsafe_base64( length )
  end

  def given_an_item_exists( params = {} )
    params[:uri] = given_a_random_string unless params.include?( :uri )
    params[:body] = given_a_random_string unless params.include?( :body )
  end

end
