require_relative '../musicalbum'

describe 'Unit testing for MusicAlbum class' do
  before :each do
    @musicalbum = MusicAlbum.new('y', '2023-02-23')
  end

  context 'initialize object' do
    it 'should be an instance of MusicAlbum' do
      expect(@musicalbum).to be_instance_of MusicAlbum
    end

    it 'should not be an instance of Item' do
      expect(@musicalbum).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@musicalbum).to be_kind_of Item
    end
  end
end
