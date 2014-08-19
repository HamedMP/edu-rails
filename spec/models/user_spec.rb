require 'rails_helper'

describe User, :type => :model do
  describe '.find_or_create_with_omniauth' do
    let(:auth) do
      {
        provider: 'facebook', uid: '123456',
        credentials: { token: 'AAADv' },
        extra: {}, info: {
          email: 'everton.carpes@gmail.com',
          name: 'Everton J. Carpes'
        }
      }.with_indifferent_access
    end

    context "user doesn't exist" do
      describe 'creating a new user' do
        it 'creates a new user' do
          expect {
            new_user = User.find_or_create_with_omniauth(auth)

            expect(new_user).to be_recently_created

          }.to change(User, :count).by(1)
        end
      end

      describe 'setting data on new user' do
        subject { User.find_or_create_with_omniauth(auth) }

        its(:oauth_token)   { should eql 'AAADv'                    }
        its(:provider)      { should eql 'facebook'                 }
        its(:uid)           { should eql '123456'                   }
        its(:full_name)     { should eql 'Everton J. Carpes'        }
        its(:email)         { should eql 'everton.carpes@gmail.com' }
      end
    end

    context 'user already exists' do
      let!(:existing_user) do
        create(:user, provider: 'facebook', uid: '123456')
      end

      describe 'finding existing user' do
        it 'finds existing user' do
          expect(User.find_or_create_with_omniauth(auth)).to eql(existing_user)
        end

        it 'does not create a user' do
          expect {
            old_user = User.find_or_create_with_omniauth(auth)

            expect(old_user).to_not be_recently_created

          }.to_not change(User, :count)
        end
      end

      describe 'updating existing user' do
        before do
          User.find_or_create_with_omniauth(auth)
        end

        subject { existing_user.reload }

        its(:oauth_token)   { should eql 'AAADv'                    }
        its(:provider)      { should eql 'facebook'                 }
        its(:uid)           { should eql '123456'                   }
        its(:full_name)     { should eql 'Everton J. Carpes'        }
        its(:email)         { should eql 'everton.carpes@gmail.com' }
      end
    end
  end
end
