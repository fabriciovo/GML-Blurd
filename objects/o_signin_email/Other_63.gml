if(async_load[?"status"])
if(async_load[?"result"] != "")
{
	if(async_load[?"id"] == request_email)
	{
		email = async_load[?"result"]
		request_password = get_string_async("Password:","")
	}
	
	if(async_load[?"id"] == request_password)
	{
		var password = async_load[?"result"]
		write_player_info(email,password)
		FirebaseAuthentication_SignIn_Email(email,password)
	}
}
