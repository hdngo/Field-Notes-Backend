class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
			t.string :title
			t.string :author
			t.string :post_date
			t.text :description
			
      t.timestamps null: false
    end
  end
end
