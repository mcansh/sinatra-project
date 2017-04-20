class TaskController < ApplicationController
  get '/tasks/?' do
    if logged_in?
      @user = User.find_by_id(params[:id])
      @user_tasks = @current_user.tasks
    end
    erb :'tasks/index'
  end

  get '/tasks/new/?' do
    if logged_in?
      erb :'tasks/new'
    else
      redirect to '/'
    end
  end

  post '/tasks' do
    if logged_in?
      task = current_user.tasks.build(params)
      if task.save
        redirect to "tasks"
      else
        redirect to 'tasks/new'
      end
    else
      redirect '/'
    end
  end

  get '/tasks/:id/?' do
    redirect to '/signin' if !logged_in?
    @task = Task.find_by(id: params[:id])
    # if there is a task and that task belongs to the current user
      # show the tasks/show
    if @task && @task.user == current_user
      erb :'/tasks/show'
    else
      redirect to '/'
      # redriect them to the root route
    end

  end

  get '/tasks/:id/edit/?' do
    redirect to '/signin' if !logged_in?
    @task = Task.find_by(id: params[:id])

    if @task && @task.user == current_user
      erb :'/tasks/edit'
    else
      redirect to '/'
    end
  end

  post '/tasks/:id' do
    redirect to '/signin' if !logged_in?
    @task = Task.find_by(id: params[:id])
    if @task && @task.user == current_user
      @task.update(params["task"])
      redirect to "/tasks/#{@task}"
    else
      redirect to '/'
    end
  end

  get '/tasks/:id/delete' do
    redirect to '/signin' if !logged_in?
    @task = Task.find_by(id: params[:id])

    if @task && @task.user == current_user
      @task = Task.delete(params[:id])
      redirect to '/tasks'
    else
      redirect to '/'
    end
  end
end
