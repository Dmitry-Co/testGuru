class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
    @users = User.all
  end

  def edit; end

  def create
    @test = current_user.tests.build(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      # binding.pry
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
  
  def rescue_with_test_not_found
    render plain: 'Test does not exist'
  end
end
