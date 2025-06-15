require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:valid_attributes) { { title: 'Test Todo', description: 'Test Description', completed: false } }

  describe "validations" do
    it "is valid with valid attributes" do
      todo = Todo.new(valid_attributes)
      expect(todo).to be_valid
    end

    it "is not valid without a title" do
      todo = Todo.new(valid_attributes.merge(title: nil))
      expect(todo).not_to be_valid
      expect(todo.errors[:title]).to include('cannot be empty')
    end

    it "is not valid with an empty title" do
      todo = Todo.new(valid_attributes.merge(title: ''))
      expect(todo).not_to be_valid
      expect(todo.errors[:title]).to include('cannot be empty')
    end
  end

  describe "creation" do
    it "creates a todo with valid attributes" do
      expect {
        Todo.create(valid_attributes)
      }.to change(Todo, :count).by(1)
    end

    it "sets created_at and updated_at timestamps" do
      todo = Todo.create(valid_attributes)
      expect(todo.created_at).to be_present
      expect(todo.updated_at).to be_present
    end
  end

  describe "updates" do
    let(:todo) { Todo.create(valid_attributes) }

    it "updates the updated_at timestamp when modified" do
      original_updated_at = todo.updated_at
      sleep(0.01) # Small delay to ensure timestamp difference
      todo.update(title: 'Updated Title')
      expect(todo.updated_at).to be > original_updated_at
    end
  end

  describe "#completed?" do
    it "returns true when completed is true" do
      todo = Todo.new(valid_attributes.merge(completed: true))
      expect(todo.completed?).to be true
    end

    it "returns false when completed is false" do
      todo = Todo.new(valid_attributes.merge(completed: false))
      expect(todo.completed?).to be false
    end

    it "returns false when completed is nil" do
      todo = Todo.new(valid_attributes.merge(completed: nil))
      expect(todo.completed?).to be_falsy
    end
  end

  describe "#to_param" do
    it "returns the id as a string" do
      todo = Todo.create(valid_attributes)
      expect(todo.to_param).to eq(todo.id.to_s)
    end

    it "returns nil when id is nil" do
      todo = Todo.new(valid_attributes)
      expect(todo.to_param).to be_nil
    end
  end

  describe "#persisted?" do
    it "returns false for new records" do
      todo = Todo.new(valid_attributes)
      expect(todo.persisted?).to be false
    end

    it "returns true for saved records" do
      todo = Todo.create(valid_attributes)
      expect(todo.persisted?).to be true
    end
  end

  describe "#to_model" do
    it "returns self" do
      todo = Todo.new(valid_attributes)
      expect(todo.to_model).to eq(todo)
    end
  end

  describe "#model_name" do
    it "returns an ActiveModel::Name instance" do
      todo = Todo.new(valid_attributes)
      expect(todo.model_name).to be_a(ActiveModel::Name)
      expect(todo.model_name.name).to eq("Todo")
    end
  end
end