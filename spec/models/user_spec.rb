require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can create a user' do
    user = User.create(user_name: '1powechri2',
                      password: 'BigPapa978',
                      email: 'dood@doodmail.grrrr')

    db_user = User.find(user.id)

    expect(user.user_name).to eq(db_user.user_name)
    expect(user.password_digest).to eq(db_user.password_digest)
    expect(user.email).to eq(db_user.email)
  end
  context 'validations' do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:user_name) }
    it { should have_secure_password }
  end
end
