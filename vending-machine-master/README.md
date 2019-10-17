# Vending Machine
This is a Java Web App utilizing Maven and Spring MVC. MySQL is used for persistent storage. The frontend is built with AngularJS and Bootstrap

# Overview

<img src="/images/vending1.png" width="600">  
You can add money with the buttons on the top row. If an item has a quantity of 0 it's greyed out.

<img src="/images/vending2.png" width="600">  
When you make a selection the door slides open via animation. Clicking on the item will remove it from the vending machine. An ajax request is sent a REST endpoint to update the quantity. Clicking the gear in the bottom right will take you to the 'internals' of the machine.  

<img src="/images/vending3.png" width="600">  
This is the list of all items added to the machine. You can create a new item via the add item button. You can edit, delete, and search the list. Each coloumn is also sortable. 

<img src="/images/vending4.png" width="600">  
This screen shows how you can edit in place. Upon saving the edit an AJAX PUT request is sent to a REST endpoint to update the record in the database.
