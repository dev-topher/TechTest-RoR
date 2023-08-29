class ChangeRestaurantsStatusStringToInt < ActiveRecord::Migration[7.0]
  def change
    
    execute <<-SQL
      UPDATE restaurants
      SET status_rest = 
        CASE
          WHEN status_rest = 'ok' THEN 1
          WHEN status_rest = 'warning' THEN 2
          WHEN status_rest = 'error' THEN 3
        END;
    SQL

    change_column :restaurants, :status_rest, :integer, default: 1, using: 'status_rest::integer'
    
  end
end
