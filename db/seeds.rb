workspace = Workspace.create(:name => 'AIDS research')

user_data_source = DataSource.create(:name => 'User limited data source')
workspace_data_source = DataSource.create(:name => 'Workspace limited data source')
public_data_source = DataSource.create(:name => 'Public data source', :public => true)
inaccessible_data_source = DataSource.create(:name => 'inaccessible data source')

user_hdfs_data_source = HdfsDataSource.create(:name => 'User limited hdfs data source')
workspace_hdfs_data_source = HdfsDataSource.create(:name => 'Workspace limited hdfs data source')
public_hdfs_data_source = HdfsDataSource.create(:name => 'Public hdfs data source', :public => true)
inaccessible_hdfs_data_source = DataSource.create(:name => 'inaccessible hdfs data source')

user_josh = User.create(:name => 'Josh')

DataSourceAccount.create(:password => 'joshpassword', :data_source => user_data_source, :user => user_josh)
DataSourceAccount.create(:password => 'sharedpassword', :data_source => public_data_source)
DataSourceAccount.create(:password => 'limitedpassword', :data_source => workspace_data_source, :workspace => workspace)

HdfsDataSourceConnectionParametersSet.create(:connection_parameters => 'I AM JOSH', :hdfs_data_source => user_hdfs_data_source, :user => user_josh)
HdfsDataSourceConnectionParametersSet.create(:connection_parameters => 'SHARED KERBEROS', :hdfs_data_source => public_hdfs_data_source)
HdfsDataSourceConnectionParametersSet.create(:connection_parameters => 'LIMITED PARAMETERS', :hdfs_data_source => workspace_hdfs_data_source, :workspace => workspace)

user_dataset = Dataset.create(:data_source => user_data_source, :name => 'social security numbers')
workspace_dataset = Dataset.create(:data_source => workspace_data_source, :name => 'patient secret stuff')
public_dataset = Dataset.create(:data_source => public_data_source, :name => 'patient names')
inaccessible_dataset = Dataset.create(:data_source => inaccessible_data_source, :name => 'whoops no authorization to this one')

user_hdfs_dataset = Dataset.create(:hdfs_data_source => user_hdfs_data_source, :name => 'eating habits')
workspace_hdfs_dataset = Dataset.create(:hdfs_data_source => workspace_hdfs_data_source, :name => 'patient supa secret stuff')
public_hdfs_dataset = Dataset.create(:hdfs_data_source => public_hdfs_data_source, :name => 'patient favorite foods')
inaccessible_hdfs_dataset = Dataset.create(:data_source => inaccessible_data_source, :name => 'whoops no authorization to this one')

WorkspaceDataset.create(:dataset => user_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => workspace_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => public_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => inaccessible_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => user_hdfs_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => workspace_hdfs_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => public_hdfs_dataset, :workspace => workspace)
WorkspaceDataset.create(:dataset => inaccessible_hdfs_dataset, :workspace => workspace)

WorkspaceDataSource.create(:workspace => workspace, :polymorphic_data_source => user_data_source)
WorkspaceDataSource.create(:workspace => workspace, :polymorphic_data_source => workspace_data_source)
WorkspaceDataSource.create(:workspace => workspace, :polymorphic_data_source => user_hdfs_data_source)
WorkspaceDataSource.create(:workspace => workspace, :polymorphic_data_source => workspace_hdfs_data_source)