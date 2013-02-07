require 'spec_helper'

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

describe UnitsController do

  # This should return the minimal set of attributes required to create a valid
  # Unit. As you add validations to Unit, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.attributes_for(:unit)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UnitsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all units as @units" do
      unit = Unit.create! valid_attributes
      get :index, {}, valid_session
      assigns(:units).should eq([unit])
    end
  end

  describe "GET show" do
    it "assigns the requested unit as @unit" do
      unit = Unit.create! valid_attributes
      get :show, {:id => unit.to_param}, valid_session
      assigns(:unit).should eq(unit)
    end
  end

  describe "GET new" do
    it "assigns a new unit as @unit" do
      get :new, {}, valid_session
      assigns(:unit).should be_a_new(Unit)
    end
  end

  describe "GET edit" do
    it "assigns the requested unit as @unit" do
      unit = Unit.create! valid_attributes
      get :edit, {:id => unit.to_param}, valid_session
      assigns(:unit).should eq(unit)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Unit" do
        expect {
          post :create, {:unit => valid_attributes}, valid_session
        }.to change(Unit, :count).by(1)
      end

      it "assigns a newly created unit as @unit" do
        post :create, {:unit => valid_attributes}, valid_session
        assigns(:unit).should be_a(Unit)
        assigns(:unit).should be_persisted
      end

      it "redirects to the created unit" do
        post :create, {:unit => valid_attributes}, valid_session
        response.should redirect_to(Unit.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved unit as @unit" do
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        post :create, {:unit => {}}, valid_session
        assigns(:unit).should be_a_new(Unit)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        post :create, {:unit => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested unit" do
        unit = Unit.create! valid_attributes
        # Assuming there are no other units in the database, this
        # specifies that the Unit created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Unit.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => unit.to_param, :unit => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested unit as @unit" do
        unit = Unit.create! valid_attributes
        put :update, {:id => unit.to_param, :unit => valid_attributes}, valid_session
        assigns(:unit).should eq(unit)
      end

      it "redirects to the unit" do
        unit = Unit.create! valid_attributes
        put :update, {:id => unit.to_param, :unit => valid_attributes}, valid_session
        response.should redirect_to(unit)
      end
    end

    describe "with invalid params" do
      it "assigns the unit as @unit" do
        unit = Unit.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        put :update, {:id => unit.to_param, :unit => {}}, valid_session
        assigns(:unit).should eq(unit)
      end

      it "re-renders the 'edit' template" do
        unit = Unit.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Unit.any_instance.stub(:save).and_return(false)
        put :update, {:id => unit.to_param, :unit => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested unit" do
      unit = Unit.create! valid_attributes
      expect {
        delete :destroy, {:id => unit.to_param}, valid_session
      }.to change(Unit, :count).by(-1)
    end

    it "redirects to the units list" do
      unit = Unit.create! valid_attributes
      delete :destroy, {:id => unit.to_param}, valid_session
      response.should redirect_to(units_url)
    end
  end

end
