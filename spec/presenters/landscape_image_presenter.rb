require 'spec_helper_unit'

describe LandscapeImagePresenter do

  describe '#random' do

    let!(:images) { ["landscape1.jpg", "landscape2.jpg", "landscape3.jpg", "landscape4.jpg", "landscape5.jpg"] }

    it 'returns a random landscape image' do
      presenter = LandscapeImagePresenter.new
      expect(images).to include presenter.random
    end

  end
end
