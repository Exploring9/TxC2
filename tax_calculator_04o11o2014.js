// Place all the behaviors and hooks related to the matching controller here./
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
// Use Gon to transfer between rails and javascript

//TODO I stopped here (Number of Income), for the next steps, i should add instances for
// income objects so that they show up on the browser - done
// Then I should create a way for them to delete these things - done

// Then I should do a thing so that people can select more regions
// And other economic details - Jquery click and they ajax more info

// Then I will have to perform the ajax thing to send the info to the server
// I will select all of the created classes and then I will send the info with the controller to the back-end
// Then I will implement the class creation for the back end (with all the details that were provided)
// Then I will create the tax class objects that will select all of the necessary tax rates from the databases
// This will happen through validations since there will be many tax classes
// I.e check they residency requirements, the size of their income, their professions and so on.

// Think of rearranging the income details according to their numbers //Use Jquery insertBefore to achieve this! // Not a priority
/*========================================================================*/
// TODO 1st Part Creating the Environment:
// A) Creating the Data PickersKrewella
var Environment_Creation_Tax = {
	//Create the Alert message box for that the upper locations are set
	Messages_And_Fetcher_For_Locations : function() {
		//Split this into two function [first] -> get the value once it is set by the upper location
		// Second that messages error messages when the above value is not set
		$("select[data-check=true]").focus(function() {
			console.log("Test: Messages_And_Fetcher_For_Locations");
			//console.log(this); console.log(this["outerHTML"]); console.log(this.getAttribute("data-upper-check"));
			var check_location = this.getAttribute("data-upper-check");
			var for_whom_to_add = this.getAttribute("name");
			var what_to_append_upper_location = $("select[name=" + check_location + "]").val();
			Environment_Creation_Tax.Check_Upper_Location(check_location, for_whom_to_add, what_to_append_upper_location);
		});
	},
	Preload_Lower_Location : function() {
		$("select[data-selector]").change(function() {
			console.log("Preload_Lower_Location -> data-selector=true DOM's elements value was chagned -> Changes will be done in the back-end");
			if (this["value"] !== "N/S") {
				console.log("Getting the Pre-Loaded value from the DB");
				Environment_Creation_Tax.Select_Option_Fetcher_Single(this);
			}
		});
	},

	Check_Upper_Location : function(check_location, for_whom_to_add, what_to_append_upper_location) {
		//console.log("I am in check_Upper_Location");
		console.log(check_location);
		console.log(for_whom_to_add);
		console.log(what_to_append_upper_location);
		//Delete the previous element
		$('.alert').remove();
		if (Add_Details_Tax.Get_Information_Details(check_location).toString() === "N/S") {
			console.log("In the append function for the values that are not set");
			//Append an element and then when he clicks on something else make it empty class="alert"
			$("<div class=alert>This is not set: " + check_location + "</div>").insertAfter("select[name=" + for_whom_to_add + "]");
		}
	},
	Date_Picker_Creation : function() {
		$("#Datepicker_Income").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
			yearRange : "2014:2015",
		});
		$("#Datepicker_Birthday").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
			yearRange : "1900:2015",
		});
	},
	Select_Option_Fetcher_Preload : function(Selected_Element) {
		var selection_test;
		// Get name and outherHTML
		var Selected_Element_List = {
			"name" : [],
			"outerHTML" : [],
		};
		//This is to select either the auto_load DOM elements or let the other one be loaded
		if (Selected_Element === "auto_load") {
			console.log($("*[data-check=false]"));
			selection_test = $("*[data-check=false]");
		}
		//Now try to get all of the DOM elements with data-check marked false
		for (var i = 0; i < selection_test.length; i++) {
			//console.log(i); console.log(selection_test);
			Selected_Element_List["name"].push(selection_test[i]["name"]);
			Selected_Element_List["outerHTML"].push(selection_test[i]["outerHTML"]);
		}

		console.log(Selected_Element_List);
		Send_Receive_Backend_Data.Ajax_Send_Fetcher(Selected_Element_List);
	},
	Select_Option_Fetcher_Single : function(Selected_Element) {
		var selection_test = Selected_Element;
		// Get name and outherHTML
		var Selected_Element_List = {
			"name" : [],
			"outerHTML" : [],
			"data-selector" : [],
			"selected" : [],
		};
		//Now try to get all of the DOM elements with data-check marked false
		Selected_Element_List["name"].push(selection_test["name"]);
		Selected_Element_List["outerHTML"].push(selection_test["outerHTML"]);
		Selected_Element_List["data-selector"].push(selection_test.getAttribute("data-selector"));
		Selected_Element_List["selected"].push(selection_test["value"]);

		console.log(Selected_Element_List);
		Send_Receive_Backend_Data.Ajax_Send_Fetcher(Selected_Element_List);
	},
};
// TODO 2nd Create the Class for holding data
// A) Create the NameSpace Mandotory Information
var Mandotory_Information_Tax = {
	// This is to check whether the class can be created
	// These variable must be present in the HTML (Plus - specify what div it has)
	// Enter whay type of data it must be string/integer and so on
	Personal_Data_Class : {
		data_Person_Residence_Country : true,
	},
	Economic_Data_Class : {
		data_Income_Size : true,
		data_Income_Currency : true,
		data_Income_Source : true,
		data_Income_Location_Country : true,
	},
};
// B) Create the Personal Tax Object
var Personal_Data_Class = function() {
	// Variables that need to be set
	// Personal Details: //
	// Mandotory
	this.data_Person_Residence_Country = Add_Details_Tax.Get_Information_Details("data_Person_Residence_Country");
	// Optional
	//Location: State -> Region -> Area
	this.data_Person_Residence_State = Add_Details_Tax.Get_Information_Details("data_Person_Residence_State");
	this.data_Person_Residence_Region = Add_Details_Tax.Get_Information_Details("data_Person_Residence_Region");
	this.data_Person_Residence_Area = Add_Details_Tax.Get_Information_Details("data_Person_Residence_Area");
	// Others:
	this.data_Person_Citizenship = Add_Details_Tax.Get_Information_Details("data_Person_Citizenship");
	this.data_Person_Marital_Status = Add_Details_Tax.Get_Information_Details("data_Person_Marital_Status");
	this.data_Person_Birthday = Add_Details_Tax.Get_Information_Details("data_Person_Birthday");
	this.data_Person_Number_Of_Children = Add_Details_Tax.Get_Information_Details("data_Person_Number_Of_Children");
};
// C) Create the Economic Data Object
var Economic_Data_Class = function(instance_number) {
	// Income Details: //
	// Automatic:
	this.data_Income_Instance = instance_number;
	// Mandotory:
	this.data_Income_Size = Add_Details_Tax.Get_Information_Details("data_Income_Size");
	this.data_Income_Currency = Add_Details_Tax.Get_Information_Details("data_Income_Currency");
	this.data_Income_Source = Add_Details_Tax.Get_Information_Details("data_Income_Source");
	this.data_Income_Location_Country = Add_Details_Tax.Get_Information_Details("data_Income_Location_Country");
	//Optional:
	//Location: State -> Region -> Area
	this.data_Income_Location_State = Add_Details_Tax.Get_Information_Details("data_Income_Location_State");
	this.data_Income_Location_Region = Add_Details_Tax.Get_Information_Details("data_Income_Location_Region");
	this.data_Income_Location_Area = Add_Details_Tax.Get_Information_Details("data_Income_Location_Area");
	this.data_Income_Date_Earned = Add_Details_Tax.Get_Information_Details("data_Income_Date_Earned");
	this.data_Income_Assets_Holding_Period_Days = Add_Details_Tax.Get_Information_Details("data_Income_Assets_Holding_Period_Days");
	this.data_Income_Economic_Sector = Add_Details_Tax.Get_Information_Details("data_Income_Economic_Sector");
	this.data_Income_Specific_Profession = Add_Details_Tax.Get_Information_Details("data_Income_Specific_Profession");
};

// TODO 3rd Part Let the classes be created
var Add_Details_Tax = {
	Personal_Data_Class : function(scope_document_ready) {
		// Call the function that will check whether we have all of the // mandatory information
		var has_mandatory_information = Add_Details_Tax.check_details(Mandotory_Information_Tax.Personal_Data_Class);
		console.log(has_mandatory_information);
		if (has_mandatory_information === true) {
			// Call a function that will create the class
			scope_document_ready.Personal_Data_Class_Created = new Personal_Data_Class();
		} else {
			// Call the function that will launch an error message, and later Also let the user post if this is a bug
			Error_Message_Tax.Add_Details_Tax(has_mandatory_information);
		}
	},
	Economic_Data_Class : function(scope_document_ready) {
		// Call the function that will check whether we have all of the
		// mandatory information
		var has_mandatory_information = Add_Details_Tax.check_details(Mandotory_Information_Tax.Economic_Data_Class);
		//console.log(has_mandatory_information);
		if (has_mandatory_information === true) {
			// Check what will be a free name for the class // Call a function to see how many Economic_Data_Class Objects exists and which one should be the next one
			console.log(Add_Details_Tax.Number_of_Classes("Economic_Data_Class", scope_document_ready));
			// Save it to variable so that Add_Details_To_Webpage knows which element to create
			scope_document_ready.create_class = Add_Details_Tax.Number_of_Classes("Economic_Data_Class", scope_document_ready);
			// Decide the number of the class
			var number_of_the_class = scope_document_ready.create_class.replace("Economic_Data_Class_Created_", "");
			// Get the digit
			// Call a function that will create the class
			console.log("Economic_Data_Class creation process");
			console.log(scope_document_ready.create_class);
			console.log(number_of_the_class);
			scope_document_ready[Add_Details_Tax.Number_of_Classes("Economic_Data_Class", scope_document_ready)] = new Economic_Data_Class(number_of_the_class);
			console.log(Object.keys(scope_document_ready));
		} else {
			// Call the function that will launch an error message, and later Also let the user post if this is a bug
			Error_Message_Tax.Add_Details_Tax(has_mandatory_information);
		}
	},
	//First check whether all the necessary data is put in
	check_details : function(mandotory) {
		var must_have_information = _.pairs(mandotory);
		console.log(must_have_information);
		// Create a loop that checks whether these values are set: // If not then alert
		for (var i = 0; i < must_have_information.length; i++) {
			var what_to_check = must_have_information[i][0];
			console.log("I am in check_details");
			//console.log(what_to_check); // console.log(what_to_check); console.log(Add_Details_Tax.Get_Information_Details(what_to_check));
			if (Add_Details_Tax.Get_Information_Details(what_to_check) === "" || Add_Details_Tax.Get_Information_Details(what_to_check) === "N/S") {
				return what_to_check;
			}
		};
		return true;
	},
	//This gets the actuall information from the website
	Get_Information_Details : function(name_of_the_element_where_the_value_is) {
		return $('[name=' + name_of_the_element_where_the_value_is + ']').val();
	},
	//This is used to determine what number will be at the end of a class
	Number_of_Classes : function(name_of_the_class, scope) {
		for (var i = 1; i < 999; i++) {
			var does_this_name_exist = name_of_the_class + "_Created_" + i;
			//console.log("I am in the Number_of_Classes"); console.log(does_this_name_exist); console.log(scope);
			if (scope[does_this_name_exist] === undefined || scope[does_this_name_exist] === "Deleted") {
				return does_this_name_exist;
			}
		}
	},
	Get_Class_Details_Tax_Calculation : function(scope_document_ready) {//TODO: Alarm about the uncreated classes and send the info to Ajax
		scope_document_ready.list_of_created_classes = {};
		console.log("Get_Class_Details_Tax_Calculation");
		console.log("Getting_Personal_Details");
		Add_Details_Tax.Get_Personal_Details(scope_document_ready);
		console.log("Getting_Economic_Details");
		Add_Details_Tax.Get_Economic_Details(scope_document_ready);
		console.log(scope_document_ready.list_of_created_classes);
		return scope_document_ready.list_of_created_classes;
	},
	Get_Personal_Details : function(scope_document_ready) {
		// Find the Person Class -> Personal_Data_Class_Created
		console.log(scope_document_ready["Personal_Data_Class_Created"]);
		if (scope_document_ready["Personal_Data_Class_Created"] === undefined) {
			Error_Message_Tax.Missing_Value("Personal Information");
		} else {
			scope_document_ready.list_of_created_classes["Personal_Data_Class_Created"] = scope_document_ready["Personal_Data_Class_Created"];
		}
	},
	Get_Economic_Details : function(scope_document_ready) {
		// Find the Economic Class -> Economic_Data_Class_Created_(Number)
		var maximum_possible_length = Object.keys(scope_document_ready).length;
		console.log(Object.keys(scope_document_ready));
		for (var number = 0; number < maximum_possible_length; number++) {
			console.log("This is the loop to find out all of the created Economic_Class_Objects");
			var name_of_Economic_Data_Class = "Economic_Data_Class_Created_" + number.toString();
			console.log(name_of_Economic_Data_Class);
			console.log(scope_document_ready[name_of_Economic_Data_Class]);
			if (scope_document_ready[name_of_Economic_Data_Class] === undefined) {
				console.log("Economic_Data_Class is undefined");
			} else if (scope_document_ready[name_of_Economic_Data_Class] === "Deleted") {
				console.log("Economic_Data_Class was deleted");
			} else {
				console.log("Adding Economic_Data_Class to the information that will be sent");
				scope_document_ready.list_of_created_classes[name_of_Economic_Data_Class] = scope_document_ready[name_of_Economic_Data_Class];
			}
		}
		//Error message if no income has added:
		console.log(scope_document_ready.list_of_created_classes);
		console.log(Object.keys(scope_document_ready.list_of_created_classes));
		if (Object.keys(scope_document_ready.list_of_created_classes).length === 1) {
			Error_Message_Tax.Missing_Value("Income information");
		}
	}
};

// TODO 4th Part let the details be added to the webpage
var Add_Details_To_Webpage = {
	//Add these details to the webpage
	Add_Personal_Details_To_Webpage : function(Object_Add_Details) {
		$('#Personal_Data_Class_Display').empty();
		var add_this_to_the_webpage = "";
		var extract_arrays_add_to_webpage = _.pairs(Object_Add_Details);
		for (var i = 0; i < extract_arrays_add_to_webpage.length; i++) {
			add_this_to_the_webpage = add_this_to_the_webpage + '<div id=' + extract_arrays_add_to_webpage[i][0] + '>' + extract_arrays_add_to_webpage[i][0] + ": " + extract_arrays_add_to_webpage[i][1] + '</div>';
		}
		$('#Personal_Data_Class_Display').append(add_this_to_the_webpage);
	},
	Add_Economic_Data_To_Webpage : function(Object_Add_Details) {
		console.log(Object_Add_Details);
		console.log(Object_Add_Details.data_Income_Instance);
		var add_this_to_the_webpage = "";
		var name_div_element_for_Economic_Data_Class = "Economic_Data_Class_Created_" + Object_Add_Details.data_Income_Instance;
		var name_div_element_added = "<div id=" + name_div_element_for_Economic_Data_Class + "></div>";
		var extract_arrays_add_to_webpage = _.pairs(Object_Add_Details);
		for (var i = 0; i < extract_arrays_add_to_webpage.length; i++) {
			add_this_to_the_webpage = add_this_to_the_webpage + '<div name=' + extract_arrays_add_to_webpage[i][0] + '>' + extract_arrays_add_to_webpage[i][0] + ": " + extract_arrays_add_to_webpage[i][1] + '</div>';
		}
		add_this_to_the_webpage = add_this_to_the_webpage + "<input type='button' value='Clear Income Details' class='Clear_Economic_Data' id=" + name_div_element_for_Economic_Data_Class + "><br>";
		$("#Economic_Data_Class_Display").append(name_div_element_added);
		$('#' + name_div_element_for_Economic_Data_Class).append(add_this_to_the_webpage + "<br>");
	},
	//This is for the preloaded information and information load when you selected the country
	Add_Input_Data_To_Select : function(data) {
		console.log("Add_Details_To_Webpage.Add_Input_Data_To_Select");
		var data = data;
		var data_names = Object.keys(data);
		var length_of_loop = data_names.length;
		var length_of_options;
		//console.log(data_names);
		for (var i = 0; i < length_of_loop; i++) {
			//console.log(data_names[i]);
			length_of_options = data[data_names[i]].length;
			$("select[name=" + data_names[i] + "]").empty();
			for (var x = 0; x < length_of_options; x++) {
				//console.log(data[data_names[i]]); console.log(data[data_names[i]][x]);
				$("select[name=" + data_names[i] + "]").append(data[data_names[i]][x]);
			}
			// Insert into the select the data-attribute that it won't need to download again
		};
	},
	// Rearrange the HTML elements so that they are in a linear order (do it after an insert) // Not a priority
};

// TODO 5th Part Remove the classes and webpage (Only for Income Details where there are multiple of them)
var Remove_Details_from_Webpage = {
	// Remove these details from the webpage and set the variable to undefined so that it can be reused
	Clear_Personal_Data : function(scope) {
		$('#Personal_Data_Class_Display').empty();
		scope.Personal_Data_Class_Created = undefined;
	},
	Clear_Economic_Data : function(scope, element_clicked) {
		var element_to_be_deleted = $(element_clicked).attr('id');
		console.log(element_to_be_deleted);
		$('#' + element_to_be_deleted).remove();
		console.log(scope[element_to_be_deleted]);
		scope[element_to_be_deleted] = "Deleted";
		//I don't actually delete the class due to the overhead, but I make it undefined
		console.log(scope[element_to_be_deleted]);
		console.log(Object.keys(scope));
	},
};

// TODO 6th Part Send the information to the Server
var Send_Receive_Backend_Data = {
	Ajax_Send_Fetcher : function(Selected_Element) {
		$.ajax({
			type : 'POST',
			url : 'http://localhost:3000/tax_calculator/sendInputData',
			data : Selected_Element,
			dataType : "json",
			success : function(data) {
				Add_Details_To_Webpage.Add_Input_Data_To_Select(data);
				console.log(data);
			},
			error : function(jqXHR, exception) {
				alert(jqXHR);
				alert(exception);
				console.log(jqXHR);
				console.log(exception);
				console.log(errorThrown);
			}
		});
	},
	Ajax_Send_Personal_Economical_Information : function(Personal_Economical_Information) {
		$.ajax({
			type : 'POST',
			url : 'http://localhost:3000/tax_calculator/personalAndTaxInfo',
			data : JSON.stringify(Personal_Economical_Information),
			dataType : "json", //See if it works without the datatype
			success : function(data) {
				console.log(data);
			},
			error : function(jqXHR, exception, errorThrown) {
				alert(jqXHR);
				alert(exception);
				console.log(jqXHR);
				console.log(exception);
				console.log(errorThrown);
			}
		});
	},
};
// TODO 7th Part Error Messages
var Error_Message_Tax = {
	Add_Details_Tax : function(error_message) {
		alert("Please enter details for this:" + error_message);
	},
	Error_weird_value : function(value) {
		alert("Weird value, check its meaning" + value);
		console.log("Weird value, check its meaning" + value);
	},
	Missing_Value : function(value) {
		alert("You need to put this information: " + value);
	},
};

//It is working without the authenticity token and the commit message
$(document).ready(function() {
	// Allowing to create classes and variables within this scope
	var scope_document_ready = this;
	var create_class = null;
	// This is set to the latest income instance that was created
	// 1st Part - Environment Creation
	// Creating the calendar for date
	Environment_Creation_Tax.Date_Picker_Creation();
	// Creating the alert messages so that the person needs to select the upper location first:
	Environment_Creation_Tax.Messages_And_Fetcher_For_Locations();
	// Make the data pre-load when the uppper_location is selected
	Environment_Creation_Tax.Preload_Lower_Location();
	// Make this autoload
	Environment_Creation_Tax.Select_Option_Fetcher_Preload("auto_load");

	// 2nd Part Getting the data:
	// This is the button to add the personal details:
	// And to create the object for personal details/delete the old one
	$('#Button_Add_Personal_Details').click(function() {
		Add_Details_Tax.Personal_Data_Class(scope_document_ready);
		//console.log(Object.keys(scope_document_ready));
		// Add these details to the webpage //console.log(scope_document_ready.Personal_Data_Class_Created);
		Add_Details_To_Webpage.Add_Personal_Details_To_Webpage(scope_document_ready.Personal_Data_Class_Created);
	});
	// This is the button to add income and send them over to rails:
	$('#Button_Add_Income_Details').click(function() {
		Add_Details_Tax.Economic_Data_Class(scope_document_ready);
		// Add these details to the webpage console.log(create_class); console.log(scope_document_ready[scope_document_ready.create_class]);
		Add_Details_To_Webpage.Add_Economic_Data_To_Webpage(scope_document_ready[scope_document_ready.create_class]);
	});
	//3rd Part Removing unwanted data:
	// Reset Personal Details:
	$('#Clear_Personal_Details').click(function() {
		Remove_Details_from_Webpage.Clear_Personal_Data(scope_document_ready);
	});
	// Get rid of an income:
	$('body').on("click", '.Clear_Economic_Data', function() {
		console.log("In the proccess of getting rid of the income");
		Remove_Details_from_Webpage.Clear_Economic_Data(scope_document_ready, this);
	});

	// Do it like in the game => store the information in javascript
	$('#Button_Calculate_Taxes').click(function() {
		var user_information_to_send = Add_Details_Tax.Get_Class_Details_Tax_Calculation(scope_document_ready);
		console.log("This is the user_information_to_send");
		console.log(user_information_to_send);
		Send_Receive_Backend_Data.Ajax_Send_Personal_Economical_Information(user_information_to_send);
	});
});
