class GroupsExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @groups = Group.where(user: current_user)
  end

  def create
    expense = Expense.create(name: expense_params[:name], author_id: current_user.id, amount: expense_params[:amount])

    if expense.save
      GroupExpense.create(expense_id: expense.id, group_id: params[:group])
      redirect_to group_path(params[:group]), notice: 'Expense created'
    else
      flash[:notice] = 'Error during creation'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
