<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.tailwindcss.com"></script>     
</head>
<body>

<div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
    <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company">
    <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Sign in to your account</h2>
  </div>
  
  <h3 id="msg" class="text-center text-orange-500 text-xl italic mt-5"></h3>

  <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
    <form id="myform" class="space-y-6" action="Register" method="POST">
      
      <div>
        <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
        <div class="mt-2">
          <input id="email" name="email" type="email" autocomplete="email" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
        </div>
      </div>

      <div>
        <div class="flex items-center justify-between">
          <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Password</label>
        </div>
        <div class="mt-2">
          <input id="password" name="password" type="password" autocomplete="current-password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
        </div>
      </div>

      <div>
        <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Register</button>
      </div>
    </form>
    
    <div id="pulse" class="border border-blue-300 shadow rounded-md p-4 max-w-sm w-full mx-auto" style="display:none">
	  <div class="animate-pulse flex space-x-4">
	    <div class="rounded-full bg-slate-700 h-10 w-10"></div>
	    <div class="flex-1 space-y-6 py-1">
	      <div class="h-2 bg-slate-700 rounded"></div>
	      <div class="space-y-3">
	        <div class="grid grid-cols-3 gap-4">
	          <div class="h-2 bg-slate-700 rounded col-span-2"></div>
	          <div class="h-2 bg-slate-700 rounded col-span-1"></div>
	        </div>
	        <div class="h-2 bg-slate-700 rounded"></div>
	      </div>
	    </div>
	  </div>
	</div>
    
  </div>
</div>


<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous">
</script>

<script>
	$(document).ready(function(){
		console.log("Page is ready..");
		
		$("#myform").on('submit', function(event){
			event.preventDefault();
			
			var f = $(this).serialize();
			
			console.log(f);
			
			$("#pulse").show();
			$("#myform").hide();
			
			$.ajax({
				url: "Register",
				data: f,
				type: 'POST',
				success: function(data, textStatus, jqXHR){
					console.log(data);
					console.log("Success");
					$("#pulse").hide();
					$("#myform").hide();
					
					if(data.trim()==='Registered!'){
						$('#msg').html("Successfully Registered");
						
					}else{
						$('#msg').html("Something went on Server");
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					console.log(data);
					console.log("Error");
					$("#pulse").hide();
					$("#myform").hide();
					$('#msg').html("Something went on Server");
				}
			})
		});
	})
</script>
</body>
</html>