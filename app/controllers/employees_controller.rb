class EmployeesController < ApplicationController
  before_action :current_employee, only: %i[show update destroy]

  def index
    @employees = Employee.includes(:contact_numbers)
    render json: @employees, include: :contact_numbers
  end

  def show
    render json: @employee, include: :contact_numbers
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: { message: 'Employee created successfully', employee: @employee }, status: :created
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: { message: 'Employee updated successfully', employee: @employee }
    else
      render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    render json: { message: 'Employee deleted successfully' }
  end

  def tax_deduction
    @employees = Employee.all
    tax_deductions = @employees.map { |employee| employee_tax(employee) }
    render json: tax_deductions
  end

  private

  def employee_tax(employee)
    yearly_salary = yearly_salary(employee)
    tax_amount = tax(yearly_salary)
    cess_amount = cess(yearly_salary)

    {
      employee_code: employee.id,
      first_name: employee.first_name,
      last_name: employee.last_name,
      yearly_salary: yearly_salary,
      tax_amount: tax_amount,
      cess_amount: cess_amount
    }
  end

  def yearly_salary(employee)
    current_date = Date.today
    doj = employee.joining_date

    start_date = [doj, Date.new(doj.year, 4, 1)].max
    end_date = [current_date, Date.new(current_date.year, 3, 31)].min

    # month count
    months_worked = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month) + 1
    employee.monthly_salary * months_worked
  end

  def tax(yearly_salary)
    case yearly_salary
    when 0..250_000
      0
    when 250_001..500_000
      (yearly_salary - 250_000) * 0.05
    when 500_001..1_000_000
      12_500 + (yearly_salary - 500_000) * 0.1
    else
      37_500 + (yearly_salary - 1_000_000) * 0.2
    end
  end

  def cess(yearly_salary)
    if yearly_salary > 2_500_000
      (yearly_salary * 0.02)
    else
      0
    end
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :joining_date, :monthly_salary,
                                     contact_numbers_attributes: [:mobile_number])
  end
end
