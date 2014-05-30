require 'spec_helper'

describe Post, :type => :model do
  describe '#is_vacancy' do
    let!(:vacancy_category) { create :category, slug: 'vacancies' }
    let!(:vacancy_post)     { create :post, category: vacancy_category }
    let!(:non_vacancy_post) { create :post }

    it { expect(vacancy_post.is_vacancy?).to     eql true  }
    it { expect(non_vacancy_post.is_vacancy?).to eql false }
  end

  describe 'scopes' do
    describe 'default' do
      let!(:post1) { create :post, published_at: 2.days.ago }
      let!(:post2) { create :post, published_at: 1.day.ago }
      let!(:post3) { create :post, published_at: 3.days.ago }

      it 'orders by publishing date' do
        expect(Post.all).to eq [post2, post1, post3]
      end
    end

    describe '.non_featured_vacancies' do
      let!(:vacancy) { create :post, is_vacancy: true }
      let!(:non_vacancy) { create :post, is_vacancy: false }
      let!(:featured_vacancy) { create :post, is_featured: true, is_vacancy: true }

      subject { Post.non_featured_vacancies }

      it { is_expected.to include vacancy }
      it { is_expected.not_to include non_vacancy }
      it { is_expected.not_to include featured_vacancy }
    end

    describe '.featured' do
      let!(:non_featured) { create :post, is_featured: false }
      let!(:featured) { create :post, is_featured: true }

      subject { Post.featured }

      it { is_expected.to include featured }
      it { is_expected.not_to include non_featured }
    end

    describe '.ordinary' do
      let!(:ordinary) { create :post }
      let!(:featured) { create :post, is_featured: true }
      let!(:vacancy) { create :post, is_vacancy: true }
      let!(:featured_vacancy) { create :post, is_vacancy: true, is_featured: true }

      subject { Post.ordinary }

      it { is_expected.to include ordinary }
      it { is_expected.not_to include vacancy }
      it { is_expected.not_to include featured }
      it { is_expected.not_to include featured_vacancy }
    end
  end

  describe 'assign_slug on validation' do
    context 'new' do
      subject { build(:post) }
      it { is_expected.to be_valid }
    end

    context 'existing' do
      before { create(:post) }

      subject { build(:post) }
      it { is_expected.to be_valid }
    end

    context 'existing with explicitly assigned' do
      before { create(:post, slug: 'slug') }

      subject { build(:post, slug: 'slug') }
      it { is_expected.to be_valid }
    end
  end
end
