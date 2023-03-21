require_relative '../genre'

describe 'Unit testing for Genre class' do
  before :each do
    @genre = Genre.new('Horror', '2022-11-03')
  end

  context 'initialize object' do
    it 'should be an instance of Genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'should not be an instance of Item' do
      expect(@genre).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@genre).to be_kind_of Item
    end
  end
end
