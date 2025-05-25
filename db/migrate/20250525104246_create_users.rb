# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :name
      String :email
      String :gender
      Text :memo
      Boolean :has_memo
      Date :birthdate
    end
  end
end
