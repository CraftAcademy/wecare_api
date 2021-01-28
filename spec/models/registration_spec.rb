RSpec.describe User, type: :model do 
  describe 'Factory Bot' do 
    it ' is expected to have a valid User FB' do 
      expect(create(:user)).to be_valid 
    end
    it 'is expected to have a valid donor FB' do
      expect(create(:donor, email: 'donor@donor.com'))
    end 
    describe 'is expected to have db columns' do
      it { is_expected.to have_db_column :encrypted_password }
      it { is_expected.to have_db_column :email }
      it { is_expected.to have_db_column :tokens }
    end 
    describe 'is expected to have validation' do 
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to validate_confirmation_of :password }
    end
  end 
end 