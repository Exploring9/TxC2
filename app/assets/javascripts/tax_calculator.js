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
/*=========================================================================*/
//NEW Coding style
// Everything is in a self-evoking function
// I will only expose what needs to be returned
// I will group everything by module
(function ($, window) {
  "use strict";
  $(document).ready(function () {
    //Scoping variables
    var GLOBAL_SCOPE = window;
    var DOCUMENT_READY_SCOPE = this;
    var created_economic_class = null;
    //TODO 1th Grounding Functions
    var useful_Function = {
      get_DOM_Details: function (name_element_where_the_value_is) {
        return $('[name=' + name_element_where_the_value_is + ']').val();
      },
      warning_Missing_Information: function (message) {
        alert("You need to enter this information: " + message);
      },
      error_Information: function (message) {
        alert("Error: " + message);
      }
    };
    //TODO 2nd Environtment Creation
    var environment_Creation_Tax = {
      date_Picker_Creation: function () {
        //This is to create the DataPicker
        $("#Datepicker_Income").datepicker({
          changeMonth: true,
          changeYear: true,
          dateFormat: "yy-mm-dd",
          yearRange: "2014:2015"
        });
        $("#Datepicker_Birthday").datepicker({
          changeMonth: true,
          changeYear: true,
          dateFormat: "yy-mm-dd",
          yearRange: "1900:2015"
        });
      },
      //PART - A Establishing whether all the needed information is there for a preload
      information_Upper_Location_Checker: function () {
        //This Checks that the upper location is set when the user mouses over
        $("select[data-check=true]").focus(function () {
          console.log("This is the environmentCreationTax.information_Upper_Location_Checker");
          var clicked_location = this.getAttribute("data-upper-check");
          var to_whom_to_add = this.getAttribute("name");
          $('.alert').remove();
          if (!useful_Function.get_DOM_Details(clicked_location)) {
            console.log("In the append function for the values that are not set");
            //Append an element and then when he clicks on something else make it empty class="alert"
            $("<div class=alert>This is not set: " + clicked_location + "</div>").insertAfter("select[name=" + to_whom_to_add + "]");
          }
        });
      },
      //PART - B [Creating all of the variables to get the INFO from the DB]
      information_Fetcher_Single: function () {
        $("select[data-selector]").change(function () {
          //The elements that I will get once an upper location is selected is loaded automatically
          //data-selector and selected (Whilst outerHTML is for more info)
          console.log("This is true - change upper location");
          var selection_scope = this;
          console.log(selection_scope);
          console.log(selection_scope["value"]);
          //The elements that I will preload only need name
          var selected_Element_List = {
            "name": [],
            "outerHTML": [],
            "data-selector": [],
            "selected": []
          };
          selected_Element_List["name"].push(selection_scope["name"]);
          selected_Element_List["outerHTML"].push(selection_scope["outerHTML"]);
          selected_Element_List["data-selector"].push(selection_scope.getAttribute("data-selector"));
          selected_Element_List["selected"].push(selection_scope["value"]);
          console.log(selected_Element_List);
          ajax_Caller.ajax_Get_Input(selected_Element_List);
        });
      },
      // BELOW IS THE MASS ADDITION
      information_Fetcher: function () {
        var selection_scope = $("*[data-check=false]");
        //The elements that I will p reload only need name
        var selected_Element_List = {
          "name": [],
          "outerHTML": [],
        };
        for (var i = 0; i < selection_scope.length; i++) {
          var selection = selection_scope[i]; //console.log(selection);
          selected_Element_List["name"].push(selection["name"]);
          selected_Element_List["outerHTML"].push(selection["outerHTML"]);
        }
        ajax_Caller.ajax_Get_Input(selected_Element_List);
      },
      //PART - C This is called once the information is received back from the DB (Ajax Call)
      add_Input_Data: function (data) {
        console.log("information_Fetcher.Add_Input_Data_To_Select");
        var data = data;
        console.log(data);
        var data_names = Object.keys(data);
        var length_of_loop = data_names.length;
        for (var i = 0; i < length_of_loop; i++) {
          //console.log(data_names[i]);
          var length_of_options = data[data_names[i]].length;
          $("select[name=" + data_names[i] + "]").empty();
          for (var x = 0; x < length_of_options; x++) {
            //console.log(data[data_names[i]]); console.log(data[data_names[i]][x]);
            $("select[name=" + data_names[i] + "]").append(data[data_names[i]][x]);
          }
        };
      }
    };
    //TODO 3rd Add Mandotory Information Tax
    var mandatory_Information_Objects = {
      // This is to check whether the class can be created
      // These variable must be present in the HTML (Plus - specify what div it has)
      // Enter whay type of data it must be string/integer and so on
      personal_Data_Object: {
        data_Person_Residence_Country: true,
      },
      economic_Data_Object: {
        data_Income_Size: true,
        data_Income_Currency: true,
        data_Income_Source: true,
        data_Income_Location_Country: true,
      },
    };
    //TODO 4th Create the Personal Data Object
    // A) Create the Personal Tax Object
    var personal_Data_Object = function () {
      // Variables that need to be set
      // Personal Details: //
      // Mandotory
      this.data_Person_Residence_Country = useful_Function.get_DOM_Details("data_Person_Residence_Country");
      // Optional
      //Location: State -> Region -> Area
      this.data_Person_Residence_State = useful_Function.get_DOM_Details("data_Person_Residence_State");
      this.data_Person_Residence_Region = useful_Function.get_DOM_Details("data_Person_Residence_Region");
      this.data_Person_Residence_Area = useful_Function.get_DOM_Details("data_Person_Residence_Area");
      // Others:
      this.data_Person_Citizenship = useful_Function.get_DOM_Details("data_Person_Citizenship");
      this.data_Person_Marital_Status = useful_Function.get_DOM_Details("data_Person_Marital_Status");
      this.data_Person_Birthday = useful_Function.get_DOM_Details("data_Person_Birthday");
      this.data_Person_Number_Of_Children = useful_Function.get_DOM_Details("data_Person_Number_Of_Children");
    };
    //B) Functions:
    var personal_Data_Object_Addition = function () {
      var check_For_Details = function () {
        console.log("In personal_Data_Object_Addition.check_For_Details");
        var mandatory_information = _.pairs(mandatory_Information_Objects.personal_Data_Object);
        for (var i = 0; i < mandatory_information.length; i++) {
          var what_to_check = mandatory_information[0][0];
          console.log(useful_Function.get_DOM_Details(what_to_check));
          if (!useful_Function.get_DOM_Details(what_to_check)) {
            warning_Missing_Information();
            return false;
          }
        };
        return true;
      };
      var warning_Missing_Information = function () {
        useful_Function.warning_Missing_Information("country residence");
      };
      //Create personal_Data_Object and add to the details to the webpage
      var create_personal_Data_Object = function () {
        DOCUMENT_READY_SCOPE.personal_Data_Object_Created = new personal_Data_Object();
        console.log(DOCUMENT_READY_SCOPE.personal_Data_Object_Created);
        add_personal_Data_Object_to_Website(DOCUMENT_READY_SCOPE.personal_Data_Object_Created);
      };
      var add_personal_Data_Object_to_Website = function (object) {
        $('#Personal_Data_Class_Display').empty();
        var add_to_webpage = "";
        var extract_arrays_of_object = _.pairs(object);
        for (var i = 0; i < extract_arrays_of_object.length; i++) {
          //console.log(extract_arrays_of_object); console.log(extract_arrays_of_object[i]); console.log(extract_arrays_of_object[i][0]); console.log(extract_arrays_of_object[i][1]);
          add_to_webpage = add_to_webpage + "<dvi id=" + extract_arrays_of_object[i][0] + ">" + extract_arrays_of_object[i][0] + ": " + extract_arrays_of_object[i][1] + "</div></br>";
        }
        $('#Personal_Data_Class_Display').append(add_to_webpage);
      };
      //===========================================================//
      //Remove information from the website:
      var remove_personal_Data_Object = function () {
        $('#Personal_Data_Class_Display').empty();
        DOCUMENT_READY_SCOPE.personal_Data_Object_Created = undefined;
      };
      //===========================================================//
      return {
        create_Personal_Object: function () {
          $('#Button_Add_Personal_Details').click(function () {
            if (check_For_Details()) {
              console.log("personal_Data_Object_Addition check_For_Details() returned true");
              create_personal_Data_Object();
            }
          });
        },
        remove_Personal_Object: function () {
          $('#Clear_Personal_Details').click(function () {
            remove_personal_Data_Object();
          });
        }
      };
    };
    //TODO 5th Create the Economic Data Object
    // A) Create the economic Data Object
    var economic_Data_Object = function (instance_number) {
      // Income Details: //
      // Automatic:
      this.data_Income_Instance = instance_number;
      // Mandotory:
      this.data_Income_Size = useful_Function.get_DOM_Details("data_Income_Size");
      this.data_Income_Currency = useful_Function.get_DOM_Details("data_Income_Currency");
      this.data_Income_Source = useful_Function.get_DOM_Details("data_Income_Source");
      this.data_Income_Location_Country = useful_Function.get_DOM_Details("data_Income_Location_Country");
      //Optional:
      //Location: State -> Region -> Area
      this.data_Income_Location_State = useful_Function.get_DOM_Details("data_Income_Location_State");
      this.data_Income_Location_Region = useful_Function.get_DOM_Details("data_Income_Location_Region");
      this.data_Income_Location_Area = useful_Function.get_DOM_Details("data_Income_Location_Area");
      this.data_Income_Date_Earned = useful_Function.get_DOM_Details("data_Income_Date_Earned");
      this.data_Income_Assets_Holding_Period_Days = useful_Function.get_DOM_Details("data_Income_Assets_Holding_Period_Days");
      this.data_Income_Economic_Sector = useful_Function.get_DOM_Details("data_Income_Economic_Sector");
      this.data_Income_Specific_Profession = useful_Function.get_DOM_Details("data_Income_Specific_Profession");
      this.data_Income_Controlling_Interest = useful_Function.get_DOM_Details("data_Income_Controlling_Interest");
    };
    var economic_Data_Object_Addition = function () {
      var check_For_Details = function () {
        console.log("In personal_Data_Object_Addition.check_For_Details");
        var mandatory_information = _.pairs(mandatory_Information_Objects.economic_Data_Object);
        for (var i = 0; i < mandatory_information.length; i++) {
          var what_to_check = mandatory_information[i][0];
          console.log(what_to_check);
          console.log(useful_Function.get_DOM_Details(what_to_check));
          if (!useful_Function.get_DOM_Details(what_to_check)) {
            warning_Missing_Information(what_to_check);
            return false;
          }
        };
        return true;
      };
      var warning_Missing_Information = function (message) {
        console.log("In economic_Data_Object_Addition warning_Missing_Information()");
        useful_Function.warning_Missing_Information(message);
      };
      var check_Number_of_Objects = function (object_name, scope) {
        for (var i = 1; i < 99; i++) {
          var object_name_searched = object_name + i;
          if (scope[object_name_searched] === undefined /*|| scope[object_name_searched] === "Deleted"*/ ) {
            return object_name_searched; //This the name that exists	
          }
        }
        useful_Function.error_Information("Too many income objects, you created over:" + i);
      };
      var create_economic_Data_Object = function () {
        //This is to get what class was created
        var object_possible_name = check_Number_of_Objects("economic_Data_Object_Created_", DOCUMENT_READY_SCOPE);
        DOCUMENT_READY_SCOPE.created_economic_class = object_possible_name;
        //This is to get its number
        var instance_number_of_object = DOCUMENT_READY_SCOPE.created_economic_class.replace("Economic_Data_Class_Created_", "");
        DOCUMENT_READY_SCOPE[object_possible_name] = new economic_Data_Object(instance_number_of_object);
        console.log("I am in economic_Data_Object_Addition -> create_economic_Data_Object");
        console.log(Object.keys(DOCUMENT_READY_SCOPE));
        add_economic_Data_Object_to_Website(DOCUMENT_READY_SCOPE[object_possible_name]);
      };
      var add_economic_Data_Object_to_Website = function (object_to_add) {
        console.log(object_to_add);
        var add_to_webpage = "";
        var name_div_Economic_Object = object_to_add.data_Income_Instance;
        console.log(name_div_Economic_Object);
        var name_div_added = "<div id=" + name_div_Economic_Object + "></div>";
        var arrays_add_to_webpage = _.pairs(object_to_add);
        for (var i = 0; i < arrays_add_to_webpage.length; i++) {
          add_to_webpage = add_to_webpage + '<div name=' + arrays_add_to_webpage[i][0] + '>' + arrays_add_to_webpage[i][0] + ": " + arrays_add_to_webpage[i][1] + '</div>';
        }
        add_to_webpage = add_to_webpage + "<input type='button' value='Clear Income Details' class='Clear_Economic_Data' id=" + name_div_Economic_Object + "><br>";
        $("#Economic_Data_Class_Display").append(name_div_added);
        console.log(add_to_webpage);
        $('#' + name_div_Economic_Object).append(add_to_webpage + "<br>");
      };
      //===========================================================//
      // Remove the income instance from the website and set the class to undefined
      var remove_economic_Data_Object = function (element_clicked) {
        var element_to_be_deleted = $(element_clicked).attr('id');
        console.log(element_to_be_deleted);
        $('#' + element_to_be_deleted).remove();
        console.log(DOCUMENT_READY_SCOPE[element_to_be_deleted]);
        DOCUMENT_READY_SCOPE[element_to_be_deleted] = undefined;
        //I don't actually delete the class due to the overhead, but I make it undefined
        console.log(DOCUMENT_READY_SCOPE[element_to_be_deleted]);
        console.log(Object.keys(DOCUMENT_READY_SCOPE));
      };
      //===========================================================//
      return {
        create_Economic_Object: function () {
          $("#Button_Add_Income_Details").click(function () {
            if (check_For_Details()) {
              console.log("economic_Data_Object_Addition check_For_Details() returned true");
              create_economic_Data_Object();
            } else {
              console.log("economic-returned false");
            }
          });
        },
        remove_Economic_Object: function () {
          $('body').on('click', '.Clear_Economic_Data', function () {
            remove_economic_Data_Object(this);
          });
        }
      };
    };
    //TODO 6th Sending the Information to Calculate the Taxes to the Server
    var get_send_Info_To_Server = function () {
      var get_Personal_Object = function (where_to_add) {
        if (DOCUMENT_READY_SCOPE["personal_Data_Object_Created"] === undefined) {
          useful_Function.warning_Missing_Information("Personal Details");
          console.log("get_Personal_Object will return false");
          return false;
        } else {
          where_to_add["personal_Data_Object_Created"] = DOCUMENT_READY_SCOPE["personal_Data_Object_Created"];
        }
      };
      var get_Economic_Object = function (where_to_add) {
        console.log(where_to_add);
        var maximum_length = 99;
        for (var number = 0; number < maximum_length; number++) {
          var name_economic_Object = "economic_Data_Object_Created_" + number.toString();
          if (DOCUMENT_READY_SCOPE[name_economic_Object] === undefined) {
            console.log("This is undefined: ");
            console.log(name_economic_Object);
          } else {
            where_to_add[name_economic_Object] = DOCUMENT_READY_SCOPE[name_economic_Object];
          }
        }
        //Error Message if no income has been added // Object.keys().length is 1 because the personal information has already been added
        //console.log(Object.keys(where_to_add)); // console.log(Object.keys(where_to_add).length);
        if (Object.keys(where_to_add).length === 1) {
          useful_Function.warning_Missing_Information("Income Information");
          console.log("get_Economic_Object will return false");
          return false;
        }
      };
      var put_all_Information = function () {
        DOCUMENT_READY_SCOPE.list_of_created_classes = {};
        var scope = DOCUMENT_READY_SCOPE.list_of_created_classes;
        get_Personal_Object(scope);
        if(Object.keys(scope).length === 0){console.log("get_Personal_Object returned false - put_all_Information");return false;}
        console.log(scope);
        get_Economic_Object(scope);
        if(Object.keys(scope).length === 1){console.log("get_Economic_Object returned false - put_all_Information");return false;}       
        console.log(scope);
        return scope;
      };
      return {
        get_send_Info: function () {
          $('#Button_Calculate_Taxes').click(function () {
            var send_info_to_Server = put_all_Information();
            if(send_info_to_Server === false){console.log("This returned an empty object"); return false;}
            console.log("This information will be sent to the server");
            console.log(send_info_to_Server);
            ajax_Caller.ajax_send_personal_economical_info(send_info_to_Server);
          });
        }
      };
    };
    //TODO 8th Ajax Caller
    var ajax_Caller = {
      ajax_Get_Input: function (selected_Element_List) {
        $.ajax({
          type: 'POST',
          url: 'http://localhost:3000/tax_calculator/sendInputData',
          data: selected_Element_List,
          dataType: "json",
          success: function (data) {
            environment_Creation_Tax.add_Input_Data(data);
          },
          error: function (jqXHR, exception, errorThrown) {
            alert(jqXHR);
            alert(exception);
            console.log(jqXHR);
            console.log(exception);
            console.log(errorThrown);
          }
        });
      },
      ajax_send_personal_economical_info: function (personal_economical_Information) {
        $.ajax({
          type: 'POST',
          url: 'http://localhost:3000/tax_calculator/personalAndTaxInfo',
          data: JSON.stringify(personal_economical_Information),
          dataType: "json", //See if it works without the datatype
          success: function (data) {
            console.log(data);
          },
          error: function (jqXHR, exception, errorThrown) {
            alert(jqXHR);
            alert(exception);
            console.log(jqXHR);
            console.log(exception);
            console.log(errorThrown);
          }
        });
      },
    };
    //TODO Code Execution
    //2nd Set the Date Picker:
    environment_Creation_Tax.date_Picker_Creation();
    //3rd Preload All of the Data
    environment_Creation_Tax.information_Fetcher();
    //4th Get the Single Info Preloaded
    //Split this into checking and if okay calling
    environment_Creation_Tax.information_Upper_Location_Checker();
    environment_Creation_Tax.information_Fetcher_Single();
    //5th 
    //A) Create personal_Data_Object
    personal_Data_Object_Addition().create_Personal_Object();
    //B) Remove it from the website
    personal_Data_Object_Addition().remove_Personal_Object();
    //6th
    //A) Create economic_Data_Object
    economic_Data_Object_Addition().create_Economic_Object();
    //B) Remove it from the website
    economic_Data_Object_Addition().remove_Economic_Object();
    //7th Send the Information to the Server through AJAX
    get_send_Info_To_Server().get_send_Info();
  });
})(jQuery, window);
// _ is to load underscore.js (I don't preload it)