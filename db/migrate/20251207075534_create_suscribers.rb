class CreateSuscribers < ActiveRecord::Migration[8.1]
  def change
    create_table :suscribers do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
