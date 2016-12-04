class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.references :user, index: true

      t.string      :name
      t.date        :birth
      t.string      :photo
      t.boolean     :sex
      t.boolean     :usd, default: nil
      t.string      :comment

      t.timestamps

    end

    add_foreign_key :patients, :users, on_delete: :cascade
    add_index :patients, [:name, :usd]
  end
end
