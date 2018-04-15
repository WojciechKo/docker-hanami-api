Hanami::Model.migration do
  change do
    create_table :trips do
      column :start_address       ,String,   null: false
      column :destination_address ,String,   null: false
      column :price               ,Integer,  null: false
      column :date                ,DateTime, null: false
    end
  end
end
