get "/dogs/new" do
  erb :"dogs/new"
end

post "/dogs" do
  @dog = Dog.new(params[:input])
  @dog.owner_id = current_user_id

  if @dog.save
    redirect "/"
  else
    @error_msgs = @dog.errors.full_messages
    erb :"dogs/new"
  end
end

get "/dogs/:dog_id" do
  @dog = Dog.find(params[:dog_id])
  erb :"dogs/show"
end

get "/dogs/:dog_id/edit" do
  @dog = Dog.find(params[:dog_id])
  erb :"dogs/edit"
end

put "/dogs/:dog_id" do
  @dog = Dog.find(params[:dog_id]).update_attributes(params[:dog])
  redirect "/"
end

delete "/dogs/:dog_id" do
  @dog = Dog.find(params[:dog_id]).destroy
  redirect "/"
end
