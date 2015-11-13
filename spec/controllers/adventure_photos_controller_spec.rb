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

RSpec.describe AdventurePhotosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # AdventurePhoto. As you add validations to AdventurePhoto, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AdventurePhotosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all adventure_photos as @adventure_photos" do
      adventure_photo = AdventurePhoto.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:adventure_photos)).to eq([adventure_photo])
    end
  end

  describe "GET #show" do
    it "assigns the requested adventure_photo as @adventure_photo" do
      adventure_photo = AdventurePhoto.create! valid_attributes
      get :show, {:id => adventure_photo.to_param}, valid_session
      expect(assigns(:adventure_photo)).to eq(adventure_photo)
    end
  end

  describe "GET #new" do
    it "assigns a new adventure_photo as @adventure_photo" do
      get :new, {}, valid_session
      expect(assigns(:adventure_photo)).to be_a_new(AdventurePhoto)
    end
  end

  describe "GET #edit" do
    it "assigns the requested adventure_photo as @adventure_photo" do
      adventure_photo = AdventurePhoto.create! valid_attributes
      get :edit, {:id => adventure_photo.to_param}, valid_session
      expect(assigns(:adventure_photo)).to eq(adventure_photo)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AdventurePhoto" do
        expect {
          post :create, {:adventure_photo => valid_attributes}, valid_session
        }.to change(AdventurePhoto, :count).by(1)
      end

      it "assigns a newly created adventure_photo as @adventure_photo" do
        post :create, {:adventure_photo => valid_attributes}, valid_session
        expect(assigns(:adventure_photo)).to be_a(AdventurePhoto)
        expect(assigns(:adventure_photo)).to be_persisted
      end

      it "redirects to the created adventure_photo" do
        post :create, {:adventure_photo => valid_attributes}, valid_session
        expect(response).to redirect_to(AdventurePhoto.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved adventure_photo as @adventure_photo" do
        post :create, {:adventure_photo => invalid_attributes}, valid_session
        expect(assigns(:adventure_photo)).to be_a_new(AdventurePhoto)
      end

      it "re-renders the 'new' template" do
        post :create, {:adventure_photo => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested adventure_photo" do
        adventure_photo = AdventurePhoto.create! valid_attributes
        put :update, {:id => adventure_photo.to_param, :adventure_photo => new_attributes}, valid_session
        adventure_photo.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested adventure_photo as @adventure_photo" do
        adventure_photo = AdventurePhoto.create! valid_attributes
        put :update, {:id => adventure_photo.to_param, :adventure_photo => valid_attributes}, valid_session
        expect(assigns(:adventure_photo)).to eq(adventure_photo)
      end

      it "redirects to the adventure_photo" do
        adventure_photo = AdventurePhoto.create! valid_attributes
        put :update, {:id => adventure_photo.to_param, :adventure_photo => valid_attributes}, valid_session
        expect(response).to redirect_to(adventure_photo)
      end
    end

    context "with invalid params" do
      it "assigns the adventure_photo as @adventure_photo" do
        adventure_photo = AdventurePhoto.create! valid_attributes
        put :update, {:id => adventure_photo.to_param, :adventure_photo => invalid_attributes}, valid_session
        expect(assigns(:adventure_photo)).to eq(adventure_photo)
      end

      it "re-renders the 'edit' template" do
        adventure_photo = AdventurePhoto.create! valid_attributes
        put :update, {:id => adventure_photo.to_param, :adventure_photo => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested adventure_photo" do
      adventure_photo = AdventurePhoto.create! valid_attributes
      expect {
        delete :destroy, {:id => adventure_photo.to_param}, valid_session
      }.to change(AdventurePhoto, :count).by(-1)
    end

    it "redirects to the adventure_photos list" do
      adventure_photo = AdventurePhoto.create! valid_attributes
      delete :destroy, {:id => adventure_photo.to_param}, valid_session
      expect(response).to redirect_to(adventure_photos_url)
    end
  end

end
