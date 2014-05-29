module OmniauthLoginTestHelper
  def current_user(*traits)
    @current_user ||= create(:user, *traits)
  end

  def login!(*traits)
    session[:user_id] = current_user(*traits).id
  end

  def set_env_with_omniauth_info!
    request.env['omniauth.auth'] = OmniAuth.config
      .mock_auth[:facebook]
  end
end

RSpec.configure do |config|
  OmniAuth.config.test_mode = true
  config.include OmniauthLoginTestHelper, :type => :controller
  config.include OmniauthLoginTestHelper, :type => :helper

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    provider: 'facebook',
    uid: '1234567',
    info: {
      nickname: 'jbloggs',
      email: 'joe@bloggs.com',
      name: 'Joe Bloggs',
      first_name: 'Joe',
      last_name: 'Bloggs',
      image: 'http://graph.facebook.com/1234567/picture?type=square',
      urls: { :Facebook => 'http://www.facebook.com/jbloggs' },
      location: 'Palo Alto, California',
      verified: true
    },
    credentials: {
      token: 'ABCDEF', # OAuth 2.0 access_token, which you may wish to store
      expires_at: 1321747205, # when the access token expires (it always will)
      expires: true # this will always be true
    },
    extra: {
      raw_info: {
        birthday: '02/23/1985',
        id: '1234567',
        name: 'Joe Bloggs',
        first_name: 'Joe',
        last_name: 'Bloggs',
        link: 'http://www.facebook.com/jbloggs',
        username: 'jbloggs',
        location: { id: '123456789', name: 'Palo Alto, California' },
        gender: 'male',
        email: 'joe@bloggs.com',
        timezone: -8,
        locale: 'en_US',
        verified: true,
        updated_time: '2011-11-11T06:21:03+0000'
      }
    }
  })
end
