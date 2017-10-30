require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    #is_password?, #reset_session_token, and ::find_by_credentials.

  end

  context 'methods' do
    subject(:user) { User.create(email: 'user@hotmail.com', password: 'password') }

    describe '#is_password?' do
      it 'returns true when the password is correct' do
        password = 'password'
        expect(user.is_password?(password)).to eq(true)
      end

      it 'returns false when the password is wrong' do
        password = 'incorrect'
        expect(user.is_password?(password)).to eq(false)
      end
    end

    describe '::find_by_credentials' do

      it 'returns nil when the email is wrong' do
        email = 'incorrect@hotmail.com'
        password = 'password'
        expect(User.find_by_credentials(email, password)).to eq(nil)
      end

      it 'returns nil when the password is wrong' do
        email = 'user@hotmail.com'
        password = 'incorrectpass'
        expect(User.find_by_credentials(email, password)).to eq(nil)

      end

      it 'returns the user when the password is correct' do
        email = 'user@hotmail.com'
        password = 'password'
        expect(User.find_by_credentials(email, password)).to eq(nil)
      end

    end

    describe '#reset_session_token' do

      it 'changes the session token of a user' do
        session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(session_token)
      end

      it 'persists the changes in the database' do
        session_token = user.session_token
        user.reset_session_token!
        user_in_database = User.find_by(email: 'user@hotmail.com')
        expect(user_in_database.session_token).to_not eq(session_token)
      end

      it 'returns the new token' do
        user.reset_session_token!
        expect(user.session_token).to eq(user.session_token)
      end
    end
  end
end
