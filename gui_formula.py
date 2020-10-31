from tkinter import *
from tkinter.ttk import *
import tkinter.messagebox
import mysql.connector as mysql


db = mysql.connect(
    host="",
    user="",
    passwd="",
    database=""
)

window = Tk()
window.title("Formula")
window.geometry("1250x1250")

label = Label(window, text="Please write a query", font=("calibri", 20))
# label.grid(column=0, row=0)
label.pack()

entry = Entry(window, width=50)
entry.pack()
# query.grid(column=0, row=1)
entry.focus()


def click():
    query = entry.get()
    cursor = db.cursor()
    try:
        cursor.execute(query)
    except (mysql.Error, mysql.Warning) as e:
        tkinter.messagebox.showerror(title="Error", message=e)
    else:
        result_list = cursor.fetchall()
        # line 35 = get the column's name
        result_string = str([i[0] for i in cursor.description])[1:-1] + '\n'
        for result in result_list:
            result_string += str(result)[1:-1] + '\n'
        result_label = Label(window, text=result_string)
        result_label.pack()


execute_query_button = Button(window, text="Execute Query", command=click)
# button.grid(column=0, row=2)
execute_query_button.pack()


window.mainloop()
