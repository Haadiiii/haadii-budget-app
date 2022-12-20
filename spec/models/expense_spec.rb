require "rails_helper"

RSpec.describe Expense, type: :model do
    describe 'Expense model' do
      before(:each) do
        @user = User.create name: 'Anonymus', email: 'anonymus@anon.co', password: 'password'
      end
  
      it 'accepts a valid name and amount' do
        expense = Expense.create! name: 'Pork ribs', amount: 13, author: @user
        expect(expense).to be_valid
      end

        it 'accepts a valid name, amount and author' do
            expense = Expense.create! name: 'Pork ribs', amount: 13, author: @user
            expect(expense).to be_valid
            end

        it 'does not accept an invalid name' do
            expense = Expense.create name: '', amount: 13, author: @user
            expect(expense).to_not be_valid
            end

        it 'does not accept an invalid amount' do
            expense = Expense.create name: 'Pork ribs', amount: '', author: @user
            expect(expense).to_not be_valid
            end

        it 'does not accept an invalid author' do
            expense = Expense.create name: 'Pork ribs', amount: 13, author: nil
            expect(expense).to_not be_valid
            end

        it 'does not accept an invalid name, amount and author' do
            expense = Expense.create name: '', amount: '', author: nil
            expect(expense).to_not be_valid
            end
    end
  end