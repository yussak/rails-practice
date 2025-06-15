require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:valid_attributes) { { title: 'Test Todo', description: 'Test Description', completed: false } }
  let(:invalid_attributes) { { title: '', description: 'Test Description', completed: false } }

  describe "GET #index" do
    it "returns a success response" do
      Todo.create(valid_attributes)
      get :index
      expect(response).to be_successful
    end

    it "assigns all todos as @todos" do
      todo = Todo.create(valid_attributes)
      get :index
      expect(assigns(:todos)).to include(todo)
    end
  end

  describe "GET #show" do
    let(:todo) { Todo.create(valid_attributes) }

    it "returns a success response" do
      get :show, params: { id: todo.id }
      expect(response).to be_successful
    end

    it "assigns the requested todo as @todo" do
      get :show, params: { id: todo.id }
      expect(assigns(:todo)).to eq(todo)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new todo as @todo" do
      get :new
      expect(assigns(:todo)).to be_a_new(Todo)
    end
  end

  describe "GET #edit" do
    let(:todo) { Todo.create(valid_attributes) }

    it "returns a success response" do
      get :edit, params: { id: todo.id }
      expect(response).to be_successful
    end

    it "assigns the requested todo as @todo" do
      get :edit, params: { id: todo.id }
      expect(assigns(:todo)).to eq(todo)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Todo" do
        expect {
          post :create, params: { todo: valid_attributes }
        }.to change(Todo, :count).by(1)
      end

      it "redirects to the created todo" do
        post :create, params: { todo: valid_attributes }
        expect(response).to redirect_to(Todo.last)
      end

      it "sets a notice flash message" do
        post :create, params: { todo: valid_attributes }
        expect(flash[:notice]).to eq('Todo was successfully created.')
      end
    end

    context "with invalid params" do
      it "does not create a new Todo" do
        expect {
          post :create, params: { todo: invalid_attributes }
        }.to_not change(Todo, :count)
      end

      it "renders the new template" do
        post :create, params: { todo: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:todo) { Todo.create(valid_attributes) }
    let(:new_attributes) { { title: 'Updated Todo', description: 'Updated Description', completed: true } }

    context "with valid params" do
      it "updates the requested todo" do
        put :update, params: { id: todo.id, todo: new_attributes }
        todo.reload
        expect(todo.title).to eq('Updated Todo')
        expect(todo.description).to eq('Updated Description')
        expect(todo.completed).to eq(true)
      end

      it "redirects to the todo" do
        put :update, params: { id: todo.id, todo: new_attributes }
        expect(response).to redirect_to(todo)
      end

      it "sets a notice flash message" do
        put :update, params: { id: todo.id, todo: new_attributes }
        expect(flash[:notice]).to eq('Todo was successfully updated.')
      end
    end

    context "with invalid params" do
      it "renders the edit template" do
        put :update, params: { id: todo.id, todo: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:todo) { Todo.create(valid_attributes) }

    it "destroys the requested todo" do
      expect {
        delete :destroy, params: { id: todo.id }
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      delete :destroy, params: { id: todo.id }
      expect(response).to redirect_to(todos_url)
    end

    it "sets a notice flash message" do
      delete :destroy, params: { id: todo.id }
      expect(flash[:notice]).to eq('Todo was successfully deleted.')
    end
  end
end