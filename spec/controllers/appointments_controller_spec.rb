require 'rails_helper'

describe AppointmentsController do

  let(:valid_attributes) {
    FactoryGirl.build(:appointment).attributes
    .merge(appointment_time: (Time.now+5.days).strftime('%m/%d/%Y %I:%M %p'),
      patient_attributes: attributes_for(:patient)) }

  let(:invalid_attributes) { Faker::Name.unique.clear
    FactoryGirl.build(:appointment).attributes.merge(appointment_time: nil) }

  let(:valid_session) { {} }

  before :all do
    # We need some sample data
    3.times do
      FactoryGirl.create :specialty
    end
    Faker::Name.unique.clear
    3.times do
      FactoryGirl.create :diagnosis
    end
    Faker::Name.unique.clear
    6.times do
      FactoryGirl.create :doctor
    end
  end

  describe "GET #new" do
    it "assigns a new appointment as @appointment" do
      get :new, {}, valid_session
      expect(assigns(:appointment)).to be_a_new(Appointment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Appointment" do
        expect {
          post :create, {appointment: valid_attributes}, valid_session
        }.to change(Appointment, :count).by(1)
      end

      it "assigns a newly created appointment as @appointment" do
        post :create, {appointment: valid_attributes}, valid_session
        expect(assigns(:appointment)).to be_a(Appointment)
        expect(assigns(:appointment)).to be_persisted
      end

      it "show the created appointment thanks page" do
        post :create, {appointment: valid_attributes}, valid_session
        expect(response).to render_template("thanks")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved appointment as @appointment" do
        post :create, {appointment: invalid_attributes}, valid_session
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end

      it "re-renders the 'new' template" do
        post :create, {appointment: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
