require 'spec_helper'

describe 'table relations' do

  subject { RailsAdmin.config(RelTest).create.fields }

  describe 'column with nullable fk and no model validations' do
    it 'should be optional' do
      find{ |f| f.name == :league_id }.required?.should == false
    end
  end

  describe 'column with non-nullable fk and no model validations' do
    it 'should be required' do
      find{ |f| f.name == :division_id }.required?.should == true
    end
  end

  describe 'column with nullable fk and a numericality model validation' do
    it 'should be required' do
      find{ |f| f.name == :player_id }.required?.should == true
    end
  end
end
