require "rails_helper"


RSpec.describe GroupExpense, type: :model do
    describe 'Group model' do
      before(:each) do
        @user = User.create! name: 'Anonymus', email: 'anonymus@anon.co', password: 'password'
        @group = Group.create! name: 'McGyver', icon: 'shorturl.at/nxQZ7', user: @user
        @expense = Expense.create! name: 'Pork ribs', amount: 13, author: @user
      end
  
      it 'creates a linking table' do
        group_expense = GroupExpense.create! expense_id: @expense.id, group_id: @group.id
        expect(group_expense).to be_valid
      end

        it 'creates a linking table with a group' do
            group_expense = GroupExpense.create! expense_id: @expense.id, group_id: @group.id
            expect(group_expense.group).to eq(@group)
            end

        it 'creates a linking table with an expense' do
            group_expense = GroupExpense.create! expense_id: @expense.id, group_id: @group.id
            expect(group_expense.expense).to eq(@expense)
            end

        it 'creates a linking table with a group and an expense' do
            group_expense = GroupExpense.create! expense_id: @expense.id, group_id: @group.id
            expect(group_expense.group).to eq(@group)
            expect(group_expense.expense).to eq(@expense)
            end
    end
  end