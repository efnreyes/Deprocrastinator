TableView and Arrays

The UITabelView is one of the most commonly used complicated user interface objects used in iOS application development. UITableViews load their data from an NSArray object, where the table's data is stored.


Deprocrastinator
================


As a user, I want to view a list of items
2 points

    Create a new project: Deprocrastinator
    Add a UITableView to your storyboard.
    Ensure the tableView has at least four rows that show TODO items
        Have fun, remember this app is the Deprocrastinatooooor

 
As a user, I want to add an item to the list
2 points

    Add a UITextField to the storyboard
    Add a UIButton to the storyboard with the title “Add” hooked up to the action onAddButtonPressed:
    In that method the text from the textfield as a new row in your TableView
    After an item is added, clear the textfield's text and dismiss the keyboard.

As a user, I want to mark an item as completed
2 points

    When the user taps a row, set that row’s textColor green

As a user, I want to delete an item from the list
2 points

    Add a UIButton titled "Edit" next to the Add button, with an action onEditButtonPressed:(id)sender
    When the edit button is pressed toggle its text to "Done"
        hint: you don't need an outlet for the button, sender is the button
    While the button's text is "Done" tapping rows in the TableView should delete them
        ​eg like the edit mode in Apple’s contacts app, but without a confirm step)


Stretches
=========


As a user, I want to swipe an item to delete it


As a user, I want to swipe an item to change it’s priority with color
3 points

    Add a UISwipeGestureRecognizer to the UITableView in the Storyboard with the direction set to Right
    Add an IBAction to the sent actions of the UISwipeGestureRecognizer and set the color of the text label for the cell to a color.  
    Use Red for high priority, Yellow for medium priority, and Green for low priority.



As a user, I want to drag and re-order my list items in the UITableView



As a user, I want to confirm deletions
2 points

    Before deleting an item, show a UIAlertView with two buttons (Delete & Cancel)
    Only delete the item if the user taps the Delete button



Bug Fixes
=========


Green items don't stick
2 points

    If you scroll the whole view so all the cells disappear then green-ness will move around to different items.
    Also if you mark an item as green and then delete it, another item will become green.
    Correct behavior: green items should stay green. Black items should stay black.

