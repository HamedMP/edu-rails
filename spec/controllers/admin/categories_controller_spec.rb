require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admin::CategoriesController, :type => :controller do

  describe "GET index" do
    let(:action) { get :index }

    it_behaves_like :action_that_requires_authentication do
      before { action }
    end

    context 'logged in' do
      before { login! }

      it "assigns all categories as @categories" do
        category = create :category
        action
        expect(assigns(:categories)).to eq([category])
      end
    end
  end

  describe "GET show" do
    let(:action) { get :show, id: category }
    let(:category) { create :category }

    it_behaves_like :action_that_requires_authentication do
      before { action }
    end

    context 'logged in' do
      before { login! }

      it "assigns the requested category as @category" do
        action
        expect(assigns(:category)).to eq(category)
      end
    end
  end

  describe "GET new" do
    let(:action) { get :new }

    it_behaves_like :action_that_requires_authentication do
      before { action }
    end

    context 'logged in' do
      before { login! }

      it "assigns a new category as @category" do
        action
        expect(assigns(:category)).to be_a_new(Category)
      end
    end
  end

  describe "GET edit" do
    let(:action) { get :edit, id: category }
    let(:category) { create :category }

    it_behaves_like :action_that_requires_authentication do
      before { action }
    end

    context 'logged in' do
      before { login! }

      it "assigns the requested category as @category" do
        action
        expect(assigns(:category)).to eq(category)
      end
    end
  end

  describe "POST create" do
    let(:action) { post :create, params }

    it_behaves_like :action_that_requires_authentication do
      let(:params) { {} }
      before { action }
    end

    context 'logged in' do
      before { login! }

      describe "with valid params" do
        let(:params) { { category: attributes_for(:category) } }

        it "creates a new Category" do
          expect {
            action
          }.to change(Category, :count).by(1)
        end

        it "assigns a newly created category as @category" do
          action
          expect(assigns(:category)).to be_a(Category)
          expect(assigns(:category)).to be_persisted
        end

        it "redirects to the created category" do
          action
          expect(response).to redirect_to(admin_category_path(Category.last))
        end
      end

      describe "with invalid params" do
        let(:params) { { category: { title: 'invalid' } } }

        it "assigns a newly created but unsaved category as @category" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Category).to receive(:save).and_return(false)
          action
          expect(assigns(:category)).to be_a_new(Category)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Category).to receive(:save).and_return(false)
          action
          expect(response).to render_template("new")
        end
      end
    end
  end

  describe "PUT update" do
    let(:action) { put :update, params.merge(id: category) }
    let(:category) { create :category }

    it_behaves_like :action_that_requires_authentication do
      let(:params) { {} }
      before { action }
    end

    context 'logged in' do
      before { login! }

      describe "with valid params" do
        let(:params) { { category: { title: "MyString" } } }
        it "updates the requested category" do
          # Assuming there are no other categories in the database, this
          # specifies that the Category created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          expect_any_instance_of(Category).to receive(:update).with({ title: "MyString" })
          action
        end

        it "assigns the requested category as @category" do
          action
          expect(assigns(:category)).to eq(category)
        end

        it "redirects to the category" do
          action
          expect(response).to redirect_to(admin_category_path(category))
        end
      end

      describe "with invalid params" do
        let(:params) { { category: { title: '' } } }
        it "assigns the category as @category" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Category).to receive(:update).and_return(false)
          action
          expect(assigns(:category)).to eq(category)
        end

        it "re-renders the 'edit' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Category).to receive(:update).and_return(false)
          action
          expect(response).to render_template("edit")
        end
      end
    end
  end

  describe "DELETE destroy" do
    let(:action) { delete :destroy, id: category }
    let!(:category) { create :category }

    it_behaves_like :action_that_requires_authentication do
      before { action }
    end

    context 'logged in' do
      before { login! }

      it "destroys the requested category" do
        expect {
          action
        }.to change{ Category.count }.by(-1)
      end

      it "redirects to the categories list" do
        action
        expect(response).to redirect_to(admin_categories_url)
      end
    end
  end

end
