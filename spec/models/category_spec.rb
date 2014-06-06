require 'spec_helper'

describe Category, :type => :model do
  let!(:big_grandfather)  { create :category }
  let!(:grandfather)      { create :category, parent: big_grandfather }
  let!(:parent1)          { create :category, parent: grandfather }
  let!(:parent2)          { create :category, parent: grandfather }
  let!(:child)            { create :category, parent: parent1 }
  let!(:sibling)          { create :category, parent: parent2 }

  describe '#up_tree' do
    it 'is a line of ancestors including itself' do
      expect(child.up_tree).to eql [big_grandfather, grandfather, parent1, child]
    end
  end

  describe '#down_roots' do
    it 'is an array of all descendants including itself' do
      expect(big_grandfather.down_roots).to match_array [
        big_grandfather, grandfather, parent1, parent2, child, sibling
      ]
    end
  end

  describe '.collection_cache_key' do
    it 'changes on creation of new category' do
      expect{ Category.collection_cache_key }.to change { create :category }
    end
  end
end
