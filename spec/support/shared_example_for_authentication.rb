shared_examples_for :action_that_requires_authentication do
  context 'not logged in' do
    it {
      origin = request.post? ? root_url : request.fullpath
      should redirect_to(login_url(provider: 'facebook',
                                   origin: origin))
    }
  end
end

shared_examples_for :action_that_skips_return_path_save do
  before { session[:return_path] = '/potato' }
  it { expect(session[:return_path]).to eql('/potato') }
end
