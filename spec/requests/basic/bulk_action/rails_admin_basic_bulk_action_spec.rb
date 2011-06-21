require 'spec_helper'

describe "RailsAdmin Basic Bulk Action" do

  subject { page }

  before(:each) do
    @players = 2.times.map { FactoryGirl.create :player }
      visit rails_admin_list_path(:model_name => "player") 
  end

  describe "bulk_delete" do
    it 'should show names of to-be-deleted players' do
      post rails_admin_bulk_action_path(:bulk_delete => '', :model_name => "player", :bulk_ids => @players.map(&:id))
      @players.each { |player| should have_content(player.name) }
    end
  end
  
  describe "bulk_export" do
    it 'should show form for export' do
      click_link "Export current view"
      @players.each { |player| should have_content("Select fields to export") }
    end
  end
end
