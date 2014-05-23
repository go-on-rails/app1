  class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @history = current_history

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @history = current_history

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    numbers = parse_numbers(params[:task][:numbers])
    if numbers.nil?
      render text: "Numbers is not valid", status: 500
      return
    end

    @history = current_history
    @task = @history.tasks.build(numbers: numbers)
    @solution = @task.create_solution solve(@task.numbers)
    
    respond_to do |format|
      if @task.save
        format.js
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end

  end
  
  def parse_numbers(data)
    if data.nil? or data.empty? or /^\s$/.match(data)
      return nil
    end

    k = data.split(/[\s]*(?:[;]|[\s])[\s]*/)
    f = []
    for t in k
      if /^-?\d+.?\d*$/.match(t)
        num = t.to_f
        rounded = num.round
        if num == rounded
          num = rounded
        end

        f << num
      else
        return nil
      end
    end
    
    return f
  end

  # It's not action
  def solve(numbers)
    a=numbers
    min = 0
    max = 0

    for i in 0...a.length
      if a[i].abs > a[max].abs
        max = i
      end
      
      if a[i].abs < a[min].abs
        min = i
      end
    end



    if (min - max).abs <=1
      j = 0
    else
      j = 1
    end

    if max > min then 
      left = min+1
      right = max
    else
      left = max+1
      right = min
    end

    for i in left...right
        j *= a[i]
    end
      
    return {max: max, min: min, result: j, selected_numbers: a[left...right]}
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
end
