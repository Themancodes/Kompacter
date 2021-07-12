class AddDetailsToVisitors < ActiveRecord::Migration[6.1]
  def change
    add_column :visitors, :location, :string
    add_column :visitors, :ip, :string
    add_column :visitors, :user_agent, :string
    add_column :visitors, :platform, :string
    remove_column :visitors, :remote_ip, :string
  end
end
