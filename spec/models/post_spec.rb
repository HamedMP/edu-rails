require 'spec_helper'

describe Post, :type => :model do
  describe '#ancestors' do
    let!(:parent) { create :category, :parent }
    let!(:child) { create :category, parent: parent }
    let!(:post) { create :post, category: child }

    it 'assigns list of categories going up' do
      expect(post.ancestors).to eql [parent, child]
    end
  end

  describe '#is_vacancy' do
    let!(:vacancy_category) { create :category, slug: 'vacancies' }
    let!(:vacancy_post)     { create :post, category: vacancy_category }
    let!(:non_vacancy_post) { create :post }

    it { expect(vacancy_post.is_vacancy?).to     eql true  }
    it { expect(non_vacancy_post.is_vacancy?).to eql false }
  end
end
