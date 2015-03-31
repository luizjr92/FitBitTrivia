class SessionsController < ApplicationController
  def new
    redirect_to '/auth/fitbit/'
  end

  def create
    auth_hash = request.env['omniauth.auth']
    token = auth_hash['credentials']['token']
    secret = auth_hash['credentials']['secret']


    $client = Fitgem::Client.new(
      :consumer_key => 'c055b4c942934b0f9c1755f17ae89df5',
      :consumer_secret => '9a89c35e8c1b40e6928bf2d1a92e0de5',
      :token => token,
      :secret => secret
    )

    @authorization = Authorization.find_by_uid(auth_hash["uid"])
    if @authorization
      render :text => "Welcome #{@authorization.user.name}!"
    else
      puts ($client.user_info['user'])['fullName']

=begin
      user = User.new :name => client.user_info['fullName']
      user.authorizations.build :uid => auth_hash["uid"]
      # user.save

      render :text => "Hi #{user.name}!"
=end
    end

  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end
end
