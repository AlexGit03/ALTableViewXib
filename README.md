# ALTableViewXib

This is a library that facilitates the representation of lists of different kinds.
Use a class called TableViewXib where this is done. basic has a default cell with text where you just have to insert it in the tableviewdatamodel and is represented,
an example you will find it in the demo.


To start just insert a viuw in your storyboard and let him extend the TableView xib class.

in the reference controller, create an object for the TableViewDataSource class:

let modelTableView = TableViewDataSource.init()
