#show all users
get '/dogs' do
  @dogs = Dog.all
  erb :'dogs/index'
end

#new dog form
get '/dogs/new' do
  if logged_in
    erb :'dogs/new'
  else
    redirect '/dogs'
  end
end

#create new dog
post '/dogs' do
  redirect '/sessions/new' if session[:id].nil?
  @new_dog = Dog.new(name: params[:name], breed: params[:breed], age: params[:age], temperment: params[:temperment], owner_id: current_user.id)
  if @new_dog.save
    redirect '/dogs'
  else
    redirect '/dogs/new'
  end
end

#get edit page
get '/dogs/:id/edit' do
  @dog = Dog.find(params[:id])
  if allow_edit(@dog)
    erb :'/dogs/edit'
  else
    redirect "/dogs/#{params[:id]}"
  end
end

#show a dog
get '/dogs/:id' do
  @dog = Dog.find(params[:id])
  erb :'/dogs/show'
end

#submit dog edit
put '/dogs/:id' do
  @dog = Dog.find(params[:id])
  @dog.update(body: params[:body], title: params[:title])
  redirect "dogs/#{@dog.id}"
end

#delete dog
delete '/dogs/:id' do
  @dog = Dog.find(params[:id])
  if allow_edit(@dog)
    @dog.destroy
    redirect "/dogs"
  else
    redirect "/dogs/#{params[:id]}"
  end
end
