require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  include_context 'users'

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  let(:patient) { create(:patient, user: user) }
  let(:form_params) { {} }

  describe 'eq time zone' do
    include_context 'authorized user'

    before { Zonebie.set_random_timezone }
    it do
      post :create, params: { patient: attributes_for(:patient) }, format: :json
      Timecop.freeze
      patient = Patient.last
      expect(patient.created_at.utc.to_s).to eq(Time.current.utc.to_s)
    end
  end

  #   describe 'GET #index' do
  #     let(:questions) { create_list(:question, 2) }
  #     before { get :index }
  #
  #     it 'list all' do
  #       expect(assigns(:questions)).to match_array(questions)
  #     end
  #
  #     it 'renders the index template' do
  #       expect(response).to render_template :index
  #     end
  #
  #     context 'user is authorized' do
  #       login_user
  #
  #       it 'assign New Question' do
  #         expect(assigns(:question)).to be_a_new(Question)
  #       end
  #       it 'assign Attach' do
  #         expect(assigns(:question).attachments.first).to be_a_new(Attachment)
  #       end
  #     end
  #   end
  #
  #   describe 'GET #show' do
  #     before { get :show, params: { id: question.id } }
  #
  #     it 'assign question' do
  #       expect(assigns(:question)).to eq question
  #     end
  #
  #     it 'render the show template' do
  #       expect(response).to render_template :show
  #     end
  #     context 'user is not authorized', js: true do
  #       before { get :edit, params: { id: question.id } }
  #
  #       it 'assign Edit Question' do
  #         expect(assigns(:question)).to eq question
  #       end
  #     end
  #
  #     context 'user is authorized', js: true do
  #       context 'attach' do
  #         login_user
  #         it 'assign Attach' do
  #           expect(assigns(:answer).attachments.first).to be_a_new(Attachment)
  #         end
  #       end
  #       context 'user not is not owner' do
  #         before do
  #           sign_in @other_user
  #           get :edit, params: { id: question.id, format: :js }
  #         end
  #         it 'assign Edit Question' do
  #           expect(assigns(:question)).to eq question
  #         end
  #       end
  #
  #       context 'user is owner' do
  #         before do
  #           sign_in @user
  #           get :edit, params: { id: question.id, format: :js }
  #         end
  #         it 'assign Edit Question' do
  #           expect(assigns(:question)).to eq question
  #         end
  #       end
  #     end
  #   end
  #
  #   describe 'GET #new' do
  #   end
  #
  #   describe 'GET #edit' do
  #   end

  describe 'POST #create' do
    let(:params) do
      {
        patient: attributes_for(:patient).merge(form_params)
      }
    end

    subject { post :create, params: params }

    it_behaves_like 'when user is unauthorized' do
      it { expect { subject }.to_not change(Patient, :count) }
      it { expect(subject).to redirect_to new_user_session_path }
    end

    it_behaves_like 'when user is authorized' do
      it { expect { subject }.to change(Patient, :count) }

      it_behaves_like 'invalid params concern', 'empty name', model: Patient do
        let(:form_params) { { name: nil } }
      end

      it_behaves_like 'invalid params concern', 'empty sex', model: Patient do
        let(:form_params) { { sex: nil } }
      end

      it_behaves_like 'invalid params concern', 'empty birth', model: Patient do
        let(:form_params) { { birth: nil } }
      end
    end
  end
  #   describe 'PATCH update' do
  #     let(:new_attr) do
  #       {
  #         title: 'b' * 5,
  #         body: 'b' * 61
  #       }
  #     end
  #
  #     let(:params) do
  #       {
  #         id: question.id,
  #         question:     { title: new_attr[:title], body: new_attr[:body] },
  #         format: :js
  #       }
  #     end
  #     let(:wrong_params) do
  #       {
  #         id: question.id,
  #         question:     { title: nil, body: nil },
  #         format: :js
  #       }
  #     end
  #     context 'user is not authorized' do
  #       let(:attr) do
  #         { title: 'b' * 6, body: 'b' * 61 }
  #       end
  #
  #       before do
  #         patch :update, params: params
  #         question.reload
  #       end
  #
  #       it 'change attributes' do
  #         expect(question.title).to_not eql new_attr[:title]
  #         expect(question.body).to_not eql new_attr[:body]
  #       end
  #     end
  #
  #     context 'user is authorized' do
  #       context 'user user is not owner' do
  #         before { sign_in @other_user }
  #
  #         let(:attr) do
  #           { title: 'b' * 6, body: 'b' * 61 }
  #         end
  #         before do
  #           patch :update, params: params
  #           question.reload
  #         end
  #
  #         it 'change attributes' do
  #           expect(question.title).to_not eql new_attr[:title]
  #           expect(question.body).to_not eql new_attr[:body]
  #         end
  #
  #         it 'render show template' do
  #           expect(response).to be_forbidden
  #         end
  #       end
  #
  #       context 'user is owner' do
  #         before { sign_in @user }
  #
  #         context 'attr is valid' do
  #           let(:attr) do
  #             { title: 'b' * 6, body: 'b' * 61 }
  #           end
  #           before do
  #             patch :update, params: params
  #             question.reload
  #           end
  #
  #           it 'change attributes' do
  #             expect(question.title).to eql new_attr[:title]
  #             expect(question.body).to eql new_attr[:body]
  #           end
  #
  #           it 'render show template' do
  #             expect(response).to render_template :update
  #           end
  #         end
  #
  #         context 'attr is not valid' do
  #           let(:attr) do
  #             { title: 'b', body: 'b' }
  #           end
  #           before do
  #             patch :update, params: wrong_params
  #             question.reload
  #           end
  #
  #           it 'does not change attributes' do
  #             expect(question.title).to_not eql wrong_params[:title]
  #             expect(question.body).to_not eql wrong_params[:body]
  #           end
  #
  #           it 'render edit template' do
  #             expect(response).to render_template :update
  #           end
  #         end
  #       end
  #     end
  #   end
  #
  #   describe 'DELETE #destroy' do
  #     context 'user is not authorized' do
  #       let!(:question) { create(:question) }
  #
  #       it 'delete in DB' do
  #         expect { delete :destroy, params: { id: question.id } }.to_not change { Question.count }
  #       end
  #
  #       it 'redirect to index' do
  #         delete :destroy, params: { id: question.id }
  #         expect(response).to redirect_to new_user_session_path
  #       end
  #     end
  #     context 'user is authorized' do
  #       context 'user is not owner' do
  #         before { sign_in @other_user }
  #
  #         let!(:question) { create(:question, user: @user) }
  #
  #         it 'delete in DB' do
  #           expect { delete :destroy, params: { id: question.id } }.to_not change { Question.count }
  #         end
  #
  #         it 'redirect to index' do
  #           delete :destroy, params: { id: question.id }
  #           expect(response).to redirect_to root_path
  #         end
  #       end
  #
  #       context 'user is owner' do
  #         before { sign_in @user }
  #
  #         let!(:question) { create(:question, user: @user) }
  #
  #         it 'delete in DB' do
  #           expect { delete :destroy, params: { id: question.id } }.to change { Question.count }.by(-1)
  #         end
  #
  #         it 'redirect to index' do
  #           delete :destroy, params: { id: question.id }
  #           expect(response).to redirect_to questions_path
  #         end
  #       end
  #     end
  #   end
end
