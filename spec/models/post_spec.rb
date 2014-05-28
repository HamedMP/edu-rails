require 'spec_helper'

describe Post, :type => :model do
  describe '#is_vacancy' do
    let!(:vacancy_category) { create :category, slug: 'vacancies' }
    let!(:vacancy_post)     { create :post, category: vacancy_category }
    let!(:non_vacancy_post) { create :post }

    it { expect(vacancy_post.is_vacancy?).to     eql true  }
    it { expect(non_vacancy_post.is_vacancy?).to eql false }
  end
end
