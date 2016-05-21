#show all users
get '/playdates' do
  @playdates = Playdate.all
  erb :'playdates/index'
end

#new playdate form
get '/playdates/new' do
  if logged_in
    erb :'playdates/new'
  else
    redirect '/playdates'
  end
end

#create new playdate
post '/playdates' do
  @new_playdate = Playdate.new(group_name: params[:group_name], location: params[:location], meet_time: params[:meet_time], creator_id: current_user.id)
  if @new_playdate.save
    redirect '/playdates'
  else
    redirect '/playdates/new'
  end
end

#get edit page
# get '/playdates/:id/edit' do
#   @playdate = Playdate.find(params[:id])
#   if allow_edit(@playdate)
#     erb :'/playdates/edit'
#   else
#     redirect "/playdates/#{params[:id]}"
#   end
# end

#show a playdate
get '/playdates/:id' do
  @playdate = Playdate.find(params[:id])
  erb :'/playdates/show'
end

#submit playdate edit
put '/playdates/:id' do
  @playdate = Playdate.find(params[:id])
  @playdate.update(body: params[:body], title: params[:title])
  redirect "playdates/#{@playdate.id}"
end

#delete playdate
delete '/playdates/:id' do
  @playdate = Playdate.find(params[:id])
  if allow_edit(@playdate)
    @playdate.destroy
    redirect "/playdates"
  else
    redirect "/playdates/#{params[:id]}"
  end
end
