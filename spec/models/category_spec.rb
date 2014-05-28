require 'spec_helper'

describe Category, :type => :model do
  describe '#tree' do
    let!(:grandfather) { create :category }
    let!(:parent) { create :category, parent: grandfather }
    subject(:child) { create :category, parent: parent }

    its(:tree) { is_expected.to eql [grandfather, parent, child] }
  end
end
