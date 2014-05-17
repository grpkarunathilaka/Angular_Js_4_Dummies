<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script type="text/javascript">
        function OrderFormController($scope) {

            // Define the model properties. The view will loop
            // through the services array and genreate a li
            // element for every one of its items.

            $scope.services = [
		{
		    name: 'Web Development',
		    price: 300,
		    active: true
		}, {
		    name: 'Design',
		    price: 400,
		    active: false
		}, {
		    name: 'Integration',
		    price: 250,
		    active: false
		}, {
		    name: 'Training',
		    price: 220,
		    active: false
		}
	];

            $scope.toggleActive = function (s) {
                s.active = !s.active;
            };

            // Helper method for calculating the total price

            $scope.total = function () {

                var total = 0;

                // Use the angular forEach helper method to
                // loop through the services array:

                angular.forEach($scope.services, function (s) {
                    if (s.active) {
                        total += s.price;
                    }
                });

                return total;
            };
        }
    </script>
    <style type="text/css">
        *
        {
            margin: 0;
            padding: 0;
        }
        
        body
        {
            font: 15px/1.3 'Open Sans' , sans-serif;
            color: #5e5b64;
            text-align: center;
        }
        
        a, a:visited
        {
            outline: none;
            color: #389dc1;
        }
        
        a:hover
        {
            text-decoration: none;
        }
        
        section, footer, header, aside, nav
        {
            display: block;
        }
        
        /*-------------------------
	The order form
--------------------------*/
        
        form
        {
            background-color: #61a1bc;
            border-radius: 2px;
            box-shadow: 0 1px 1px #ccc;
            width: 400px;
            padding: 35px 60px;
            margin: 50px auto;
        }
        
        form h1
        {
            color: #fff;
            font-size: 64px;
            font-family: 'Cookie' , cursive;
            font-weight: normal;
            line-height: 1;
            text-shadow: 0 3px 0 rgba(0,0,0,0.1);
        }
        
        form ul
        {
            list-style: none;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            text-align: left;
            margin: 20px 0 15px;
        }
        
        form ul li
        {
            padding: 20px 30px;
            background-color: #e35885;
            margin-bottom: 8px;
            box-shadow: 0 1px 1px rgba(0,0,0,0.1);
            cursor: pointer;
        }
        
        form ul li span
        {
            float: right;
        }
        
        form ul li.active
        {
            background-color: #8ec16d;
        }
        
        div.total
        {
            border-top: 1px solid rgba(255,255,255,0.5);
            padding: 15px 30px;
            font-size: 20px;
            font-weight: bold;
            text-align: left;
            color: #fff;
        }
        
        div.total span
        {
            float: right;
        }
    </style>
    <title>Index</title>
</head>
<body>
    <div>
        <h2>
            Hello World</h2>
        <div id="main" ng-app>
            <!-- The navigation menu will get the value of the "active" variable as a class.
		 The $event.preventDefault() stops the page from jumping when a link is clicked. -->
            <nav class="{{active11}}" ng-click="$event.preventDefault()">

		<!-- When a link in the menu is clicked, we set the active variable -->

		<a href="#" class="home" ng-click="active11='home'">Home</a>
		<a href="#" class="projects" ng-click="active11='projects'">Projects</a>
		<a href="#" class="services" ng-click="active11='services'">Services</a>
		<a href="#" class="contact" ng-click="active11='contact'">Contact</a>
	</nav>
            <!-- ng-show will show an element if the value in the quotes is truthful,
		 while ng-hide does the opposite. Because the active variable is not set
		 initially, this will cause the first paragraph to be visible. -->
            <p ng-hide="active11">
                Please click a menu item</p>
            <p ng-show="active11">
                You chose <b>{{active11}}</b></p>
            <form ng-controller="OrderFormController">
                <h1>
                    Services</h1>
                <ul>
                    <!-- Loop through the services array, assign a click handler, and set or
			remove the "active" css class if needed -->
                    <li ng-repeat="service in services" ng-click="toggleActive(service)" ng-class="{active:service.active}">
                        <!-- Notice the use of the currency filter, it will format the price -->
                        {{service.name}} <span>{{service.price | currency}}</span> </li>
                </ul>
                <div class="total">
                    <!-- Calculate the total price of all chosen services. Format it as currency. -->
                    Total: <span>{{total() | currency}}</span>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
