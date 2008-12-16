# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "empresas", :force => true do |t|
    t.string   "nome",                                                        :default => "", :null => false
    t.string   "razao_social",                                                :default => "", :null => false
    t.string   "endereco"
    t.string   "telefone"
    t.string   "contato"
    t.integer  "cnpj",           :limit => 14, :precision => 14, :scale => 0
    t.string   "cep"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "pais"
    t.integer  "insc_estadual",  :limit => 12, :precision => 12, :scale => 0
    t.integer  "insc_municipal", :limit => 12, :precision => 12, :scale => 0
    t.string   "obs"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notas", :force => true do |t|
    t.integer  "numero",                        :null => false
    t.float    "valor",      :default => 0.0,   :null => false
    t.date     "emissao"
    t.boolean  "cancelada",  :default => false, :null => false
    t.integer  "empresa_id"
    t.integer  "usuario_id"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome",            :default => "", :null => false
    t.string   "hashed_password", :default => "", :null => false
    t.string   "email",           :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
