from tkinter import *
from tkinter import ttk
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
label.pack()

entry = Entry(window, width=50)
entry.pack()
entry.focus()


def click():
    query = entry.get()
    cursor = db.cursor()
    try:
        cursor.execute(query)
    except (mysql.Error, mysql.Warning) as e:
        tkinter.messagebox.showerror(title="Error", message=e)
    else:
        result_of_query = cursor.fetchall()
        columns_name = [i[0] for i in cursor.description]
        list_box = ttk.Treeview(window, columns=columns_name, show='headings')
        for col in columns_name:
            list_box.heading(col, text=col)
        for result in result_of_query:
            list_box.insert("", "end", values=result)
        list_box.pack()


execute_query_button = Button(window, text="Execute Query", command=click)
execute_query_button.pack()

window.mainloop()
