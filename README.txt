TODO(1)                           General Commands Manual                          TODO(1)

NAME
       todo - a minimalist todo list manager

SYNOPSIS
       todo [-vhex] [-a "todo item"] [-d todo-number] [-d "todo phrase"]

DESRIPTION
       todo  is a simple, minimalist todo list manager. Users can add items to a todo list
       or delete them. Deleted items are archived and can be reviewed.

       The default location of the todo list can be set with the  TODO  environment  vari‐
       able. If unset, a the default file is ~/todo.txt.

       If  todo  is used within a tmux session, the filename of the todo list inherits the
       name of the current session. This allows for unique todo lists based on  tmux  con‐
       text.

       The options are as follows:

       no parameters
              If no parameters are passed to todo, then the current todo list will be dis‐
              played to standard out.

       -a  quoted_todo_item
              Add a new todo list item

       -d  item_number_or_phrase
              Delete a todo list item by its number or by a string.  If a string  is  pro‐
              vided,  any todo list item that matches that string will be removed. Deleted
              items are moved to the archive.

       The archive file is named identically to the todo file with the exception of a .ar‐
       chive added before the extension. For example, todo.txt would have an archive named
       todo.archive.txt in the same folder.

       -e     Open the todo file in your editor.

       -x     Display the archive file.

       -v     Display current version information.

       -h     Show the help.

EXIT STATUS
       The todo utility exits 0 on success, and >0 if an error occurs.

EXAMPLES
       todo   Displays the current todo list

       todo -a `this is a new todo list item'
              Adds a new item to the current todo list

       todo -d 3
              Deletes item #3 from the current todo list

       todo -x
              Shows the archive for the current todo list

LICENSE
       GNU General Public License v3.0 or later at

       https://www.gnu.org/licenses/gpl-3.0-standalone.html

BUGS
       Report issues at the git repository at https://github.com/jamestomasino/todo

AUTHOR
       James Tomasino <james (at) tomasino (dot) org>

2020.07.10                             10 July 2020                                TODO(1)
