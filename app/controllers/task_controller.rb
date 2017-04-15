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
    if logged_in?
      @task = Task.find(params[:id])
      erb :'/tasks/show'
    else
      redirect to '/'
    end
  end

  get '/tasks/:id/edit/?' do
    if logged_in?
      @task = Task.find(params[:id])
      erb :'/tasks/edit'
    else
      redirect to '/'
    end
  end

  post '/tasks/:id' do
    if logged_in?
      @task = Task.find(params[:id])
      @task.update(params["task"])
      if @task.save
        redirect to "tasks/#{@task.id}"
      else
        erb :'/tasks/edit'
      end
    end
  end

  get '/tasks/:id/delete' do
    if logged_in?
      @task = Task.delete(params[:id])
      redirect to '/tasks'
    end
  end
end
