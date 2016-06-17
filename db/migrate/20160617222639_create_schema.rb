class CreateSchema < ActiveRecord::Migration
  def up
    create_table :data_sources do |t|
      t.timestamps null: false
    end

    create_table :data_source_accounts do |t|
      t.integer :data_source_id
      t.integer :user_id
      t.integer :workspace_id

      t.timestamps null: false
    end

    create_table :datasets do |t|
      t.integer :data_source_id
      t.integer :hdfs_data_source_id

      t.timestamps null: false
    end

    create_table :hdfs_data_sources do |t|
      t.timestamps null: false
    end

    create_table :hdfs_data_source_connection_parameters_sets do |t|
      t.integer :hdfs_data_source_id
      t.integer :user_id
      t.integer :workspace_id

      t.timestamps null: false
    end

    create_table :users do |t|
    end

    create_table :workspaces do |t|
      t.timestamps null: false
    end

    create_table :workspace_data_sources do |t|
      t.integer :polymorphic_data_source_id
      t.integer :polymorphic_data_source_type
      t.integer :workspace_id

      t.timestamps null: false
    end

    create_table :workspace_datasets do |t|
      t.integer :dataset_id
      t.integer :workspace_id

      t.timestamps null: false
    end
  end
end
