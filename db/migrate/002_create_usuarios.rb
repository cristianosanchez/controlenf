class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string   :nome, :null => false
      t.string   :hashed_password, :null => false
      t.string   :email, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
