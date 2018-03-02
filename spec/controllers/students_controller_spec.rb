require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe 'GET #index' do
    it 'should be empty when no `Student`s are created' do
      get :index
      expect(assigns(:students)).to be_empty
    end

    it 'should contain 1 student when 1 `Student` is created' do
      Student.create(
        first_name: "Daniel",
        last_name: "Goh",
        email: "example@example.com",
        github_url: "http://github.com",
        twitter_url: "http://twitter.com",
        birth_date: DateTime.current
      )
      get :index
      expect(assigns(:students).size).to eq 1
    end
  end

  describe 'GET #show' do
    it 'should return the correct student' do
      student = Student.create(
        first_name: "Daniel",
        last_name: "Goh",
        email: "example@example.com",
        github_url: "http://github.com",
        twitter_url: "http://twitter.com",
        birth_date: DateTime.current
      )
      get :show, params: { id: student.id }
      expect(assigns(:student)).to be_instance_of(Student)
      expect(assigns(:student)).to eq student
    end
  end

  describe 'GET #new' do
    it do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  describe 'POST #create' do
    context 'when student save is successful' do
      it do
        student_params = {
          first_name: "Daniel",
          last_name: "Goh",
          email: "example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        }
        post :create, params: { student: student_params }
        expect(response).to redirect_to students_path
      end
    end

    context 'when student save is unsuccessful' do
      it do
        student_params = {
          first_name: "Daniel",
          last_name: "Goh",
          email: "",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        }
        post :create, params: { student: student_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'should return the correct student' do
      student = Student.create(
        first_name: "Daniel",
        last_name: "Goh",
        email: "example@example.com",
        github_url: "http://github.com",
        twitter_url: "http://twitter.com",
        birth_date: DateTime.current
      )
      get :edit, params: { id: student.id }
      expect(assigns(:student)).to be_instance_of(Student)
      expect(assigns(:student)).to eq student
    end
  end

  describe 'PUT/PATCH #update' do
    context 'when student update is successful' do
      it do
        student = Student.create(
          first_name: "Daniel",
          last_name: "Goh",
          email: "example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        )
        student_params = {
          first_name: "Daniella",
          last_name: "Goh",
          email: "another_example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        }
        put :update, params: { id: student.id, student: student_params }
        expect(response).to redirect_to students_path
      end

      it do
        student = Student.create(
          first_name: "Daniel",
          last_name: "Goh",
          email: "example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        )
        student_params = {
          first_name: "Daniella",
          last_name: "Goh",
          email: "another_example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        }
        put :update, params: { id: student.id, student: student_params }
        expect(assigns(:student)).to have_attributes(first_name: "Daniella",
                                                     email:
                                                     "another_example@example.com")
      end
    end

    context 'when student update is unsucessful' do
      it do
        student = Student.create(
          first_name: "Daniel",
          last_name: "Goh",
          email: "example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        )
        student_params = {
          first_name: "Daniella",
          last_name: "Goh",
          email: "",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        }
        put :update, params: { id: student.id, student: student_params }
        expect(response).to render_template(:edit)
      end

      it do
        student = Student.create(
          first_name: "Daniel",
          last_name: "Goh",
          email: "example@example.com",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        )
        student_params = {
          first_name: "Daniel",
          last_name: "Goh",
          email: "",
          github_url: "http://github.com",
          twitter_url: "http://twitter.com",
          birth_date: DateTime.current
        }
        put :update, params: { id: student.id, student: student_params }
        expect(assigns(:student).reload).to have_attributes(email: "example@example.com")
      end
    end
  end

  describe 'DELETE #destroy' do
    it do
      student = Student.create(
        first_name: "Daniel",
        last_name: "Goh",
        email: "example@example.com",
        github_url: "http://github.com",
        twitter_url: "http://twitter.com",
        birth_date: DateTime.current
      )
      delete :destroy, params: { id: student.id }
      expect(response).to redirect_to students_path
      expect(assigns(:student)).to be_destroyed
    end
  end

end
