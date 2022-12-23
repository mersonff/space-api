# frozen_string_literal: true

class DropAuthors < ActiveRecord::Migration[7.0]
  def change
    drop_table :books
    drop_table :authors
  end
end
