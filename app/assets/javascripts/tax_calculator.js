// Place all the behaviors and hooks related to the matching controller here./
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
// Use Gon to transfer between rails and javascript

/* ===========================================================================================*/
// Variables that need to be set
var data_personResidence = null;
var data_sizeOfIncome=[];
var data_typeOfIncome=[];
var data_locationOfIncome=[];
// For now I won't take the currency of the income
var data_denominationOfIncome=[];
//var typesOfDataForIncome = [data_sizeOfIncome,data_typeOfIncome,data_locationOfIncome];
/* ===========================================================================================*/
// 1st Part Functions to get the data:

// Personal Details (Get and Append):
var AddPersonalDetails = function(){
    data_personResidence = $('select[name=residence]').val();
    var show_personResidence = "residence="+data_personResidence;
    // This is to add the data to the html page
    $('#personalDetails').append('<p id=personalDataDisplayed>'+show_personResidence+'</p>');
    console.log("This is the residence:"+show_personResidence);
};

// Income Details (Get):
var AddIncomeDetails = function(){
    data_sizeOfIncome.push($('input[name=sizeOfIncome]').val());
    data_typeOfIncome.push($('select[name=sourceOfIncome]').val());
    data_locationOfIncome.push($('select[name=locationOfIncome]').val());
    console.log("This is from income details:"+data_sizeOfIncome+"/"+data_typeOfIncome+"/"+data_locationOfIncome);
};
// Income Details (Append): //Add the currency later
var AppendIncomeDetails = function(){
  $('#currentIncome').append('<p id=currentIncomeDisplayed'+data_sizeOfIncome.length
  +'>Record:'+data_sizeOfIncome.length+'</br> Size of the income:'
  +_.last(data_sizeOfIncome)+'</br>Type of Income:'
  +_.last(data_typeOfIncome)+'<br> Location:'+_.last(data_locationOfIncome)
  +'</br><input type="button" class="clearIncomeData" name="Clear Income Data" value="Clear Income Data" id='
  +data_sizeOfIncome.length+'></input></p>');
};
/* ===========================================================================================*/
// 2nd Part: Remove Unwanted Data from HTML and Array
//This is for personal details:
var ResetPersonalDetails = function(){
    data_personResidence = null;
    $('#personalDataDisplayed').remove();
};
//This is for income details:
var ResetOneIncomeDetails = function(NumberOfTheBox){
	//Get the number of the item to be removed and remove it from HTML and the array
	console.log("You are in the Reset one income detail function");
	console.log(NumberOfTheBox);
	$('#currentIncomeDisplayed'+NumberOfTheBox.toString()).remove();
	//Remove it from the array:
	data_sizeOfIncome[(NumberOfTheBox-1)] = 'x';
	data_typeOfIncome[(NumberOfTheBox-1)] = 'x';
	data_locationOfIncome[(NumberOfTheBox-1)] = 'x';
};
/* ===========================================================================================*/
// Here is the code to send the message to the server
// Match uses Regexp to see whether there are any numbers in the income array
var SendPersonalAndTaxInformation = function(){
	if(!data_personResidence){
		alert("PersonalResidency data is not set: "+data_personResidence);
	} else if (!data_sizeOfIncome.toString().match(/[0-9]/g || data_sizeOfIncome.length === 0)){
		alert("Income details were not put in: "+data_sizeOfIncome);
	} else {
		GetRidOfTheXInTheArray();
        SendingTheInformation();
     }
};

var GetRidOfTheXInTheArray = function(){
    data_sizeOfIncome = _.without(data_sizeOfIncome,"x");
    data_typeOfIncome = _.without(data_typeOfIncome,"x");
    data_locationOfIncome = _.without(data_locationOfIncome,"x");
};
// Json.stringify is used since that is the best way to send over info otherwise it won't be properly
// processed
var SendingTheInformation = function(){
    $.ajax({
       type: 'POST',
       url: 'http://localhost:3000/tax_calculator/personalAndTaxInfo',
       data: {
       	personal:                 data_personResidence,
       	sizesOfIncome: JSON.stringify(data_sizeOfIncome),
       	typesOfIncome: JSON.stringify(data_typeOfIncome),
       	locationsOfIncome: JSON.stringify(data_locationOfIncome)
       	}
    });	
};
//It is working without the authenticity token and the commit message
$(document).ready(function(){
  
  // 1st Part Getting the data:
  // This is the button to add the personal details:
  $('#buttonAddPersonalDetails').click(function(){
    AddPersonalDetails();
  });
  // This is the button to add income and send them over to rails:
  $('#buttonAddIncomeDetails').click(function(){
    AddIncomeDetails();
    // Here I will add the income details in a list
    AppendIncomeDetails();
  });
  //2nd Part Removing unwanted data:
  // Reset Personal Details:
  $('#clearPersonalDetails').click(function(){
    ResetPersonalDetails();
  });
  // Get rid of an income:
  $('body').on("click",'.clearIncomeData',function(){
    ResetOneIncomeDetails(this.id);
  });
  
  // Do it like in the game store the information in javascript
  $('#buttonCalculateTaxes').click(function(){
      SendPersonalAndTaxInformation();
  });
});