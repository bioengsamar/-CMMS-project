import mysql.connector
from flask import Flask, render_template,request,Response,redirect, url_for,session
import os
import pymysql
import io
import xlwt
import numpy as np
from flaskext.mysql import MySQL

mydb = mysql.connector.connect(
 host="localhost",
 user="root",
  passwd="mysql",
  database="database"
)
mycursor = mydb.cursor()
mysql = MySQL()
app = Flask(__name__)
app.secret_key = os.urandom(24)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'mysql'
app.config['MYSQL_DATABASE_DB'] = 'database'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor(pymysql.cursors.DictCursor)

@app.route('/index', methods=['GET', 'POST'])
def login():
    global Name
    global ID
    
    if request.method == "POST":

         req = request.form
         Name= req.get('username')
         ID= req.get('password')
         print(ID)
         if not (Name,) in engineer_name():
            print("Username not found")
            #print()
            return redirect(request.url)
         else:
            mycursor.execute("SELECT ID FROM engineers WHERE engineers.Name=%s",(Name,))
            myresult = mycursor.fetchall()
            print(myresult[0])

         if not (int(ID),) == myresult[0]:
            print((int(ID),))
            print('incorrect')
            #print(ID)
            return redirect(request.url)
         else:
            
            session["USERNAME"] = Name
            print(session["USERNAME"])
            print("correct id")
            print(ID)
            return redirect(url_for('home_page'))
                
                
    return render_template("index.html")

def engineer_name():
    mycursor.execute("SELECT engineers.Name FROM engineers")
    myresult2 = mycursor.fetchall()
    print(myresult2)
    return myresult2
    
@app.route('/')
def home_page():
   if not session.get("USERNAME") is None:
        Name = session.get("USERNAME")
        return render_template("home.html", user=Name)
        
   else:
        print("No username found in session")
        return redirect(url_for("login"))
    
@app.route("/sign_out")
def sign_out():

    session.pop("USERNAME", None)

    return redirect(url_for('login'))

@app.route('/profile', methods = ['POST', 'GET'])
def profile():
     if request.method == 'POST':
        return render_template('home.html')
     else:
        mycursor.execute("SELECT * FROM engineers WHERE engineers.ID=%s",(ID,))
        row_headers=[x[0] for x in mycursor.description] 
        myresult = mycursor.fetchall()
        data={
         'message':"data retrieved",
         'rec':myresult,
         'header':row_headers
           }
        return render_template('profile.html',data=data)
    
@app.route('/register')
def register():
  return render_template('register.html')

@app.route('/register',methods = ['POST', 'GET'])
def register_():
   if request.method == 'POST': 
      Name= request.form.get('username')
      Email = request.form.get('email')
      ID= request.form.get('ID')
      sql = "INSERT INTO engineers (Name,Email,ID) VALUES (%s, %s, %s)"
      val = (Name,Email,ID)
      mycursor.execute(sql, val)
      mydb.commit()   
 
      return render_template('index.html')
   else:
      return render_template('register.html')
    
@app.route('/inventory_equipment', methods = ['POST', 'GET'])
def inventory_equipment():
     if request.method == 'POST':
        return render_template('home.html')
     else:
        mycursor.execute("SELECT * FROM devices ")
        row_headers=[x[0] for x in mycursor.description] 
        myresult = mycursor.fetchall()
        data={
         'message':"data retrieved",
         'rec':myresult,
         'header':row_headers
           }
        return render_template('inventory_equipment.html',data=data)

@app.route('/dental')
def Dental():
   return render_template('dental.html')

@app.route('/view_equip_dental', methods = ['POST', 'GET'])
def view_equip_dental():
     if request.method == 'POST':
        return render_template('dental.html')
     else:
        mycursor.execute("SELECT * FROM devices WHERE Department='Dental'")
        row_headers=[x[0] for x in mycursor.description] 
        print(row_headers)
        myresult = mycursor.fetchall()
        data={
         'message':"data retrieved",
         'rec':myresult,
         'header':row_headers
           }
        return render_template('view_equip_dental.html',data=data)

@app.route('/inspection',methods = ['POST', 'GET'])
def daily_inspection():
   if request.method == 'POST': 
      type = request.form.getlist('type')
      specification = request.form.getlist('specific')
      item_checked= request.form.getlist('item')
      done_check= request.form.getlist('check')
      signature= request.form.getlist('signature')
      for m,k,i,j,l in zip(type,specification,item_checked,done_check,signature):
          sql = "INSERT INTO daily_inspection (type,specification,item_checked,done_check,signature) VALUES (%s, %s, %s, %s, %s)"
          val = (m,k,i,j,l)
          mycursor.execute(sql, val)
          mydb.commit()   
     
      return render_template('dental.html')
   else:
      return render_template('inspection.html')
  

  
@app.route('/upload')
def upload_form():
 return render_template('dental.html')

@app.route('/download/report/execl1')
def download_report():
  cursor.execute("SELECT type,specification,item_checked,done_check,signature FROM daily_inspection")
  result1 = cursor.fetchall()
   #output in bytes
  output = io.BytesIO()
  #create WorkBook object
  workbook = xlwt.Workbook()
  #add a sheet
  sh = workbook.add_sheet('daily_inspection dental Data')
  #style= xlwt.XFStyle()
  #style.alignment.wrap = 1
  style_head= xlwt.easyxf('alignment: wrap True; align: horiz center')
  tall_style = xlwt.easyxf('font:height 150; ')
  #add headers
  sh.write(0, 0, 'Type ',style_head)
  sh.write(0, 1, 'Specific ',style_head)
  sh.write(0, 2, 'Items to be checked ',style_head)
  sh.write(0, 3, 'Done_check',style_head)
  sh.write(0, 4, 'Engineer Signature',style_head)
  
  idx = 0
  for row in result1:
   sh.write(idx+1, 0, row['type'],style_head)
   sh.write(idx+1, 1, row['specification'],style_head)
   sh.write(idx+1, 2, row['item_checked'],style_head)
   sh.write(idx+1, 3, row['done_check'],style_head)
   sh.write(idx+1, 4, row['signature'],style_head)
   idx += 1
   
  #adjust row and col size
  for col_index in range(5):
      sh.col(col_index).width = 256 * 20 
      sh.col(col_index).width
  for row_index in np.arange(1,28):
     print(row_index)
     sh.row(row_index).set_style(tall_style)
   
  workbook.save(output)
  output.seek(0)
   
  return Response(output, mimetype="application/ms-excel", headers={"Content-Disposition":"attachment;filename=daily_inspection report.xls"})
@app.route('/clinics')
def clinics():
   return render_template('clinics.html')

@app.route('/clinics_equipment', methods = ['POST', 'GET'])
def clinics_equipment():
     if request.method == 'POST':
        return render_template('clinics.html')
     else:
        mycursor.execute("SELECT * FROM devices WHERE Department='heart clinic' OR  Department='dermatology clinic' OR  Department='chest diseases clinic' OR Department='Psychological and neurological clinic' OR Department='Obstetrics and Gynaecology clinic' ")
        row_headers=[x[0] for x in mycursor.description] 
        #print(row_headers)
        myresult = mycursor.fetchall()
        print(myresult)
        data={
         'message':"data retrieved",
         'rec':myresult,
         'header':row_headers
           }
        return render_template('clinics_equipment.html',data=data)
    
@app.route('/Risk_Assess_clinics',methods = ['POST', 'GET'])
def Risk_Assess():
   if request.method == 'POST': 
      Department = request.form.getlist('Department')
      Equipment = request.form.getlist('Equipment')
      serial_Num=request.form.getlist('serial')
      Done_or_Not=request.form.getlist('maintenance')
      signature= request.form.getlist('signature')
      Date=request.form.getlist('Date')
      A_Equipment_Function=request.form.getlist('Equipment Function')
      B_Risk_associated_with_equipment_failure=request.form.getlist('Risk associated with equipment failure')
      C_Preventive_maintenance_requirement=request.form.getlist('Preventive maintenance requirement')
      D_Likelihood_failure=request.form.getlist('Likelihood of failure')
      E_Main_area_of_equipment_use=request.form.getlist('Main area of equipment use')
      Total_Score=request.form.getlist('Total')
      Inventory_Classification_Result=request.form.getlist('Inventory')
      for m,k,i,y,l,n,t,r,d,b,u,j,v in zip(Department,Equipment,serial_Num,Done_or_Not,signature,Date,A_Equipment_Function,B_Risk_associated_with_equipment_failure,C_Preventive_maintenance_requirement,D_Likelihood_failure,E_Main_area_of_equipment_use,Total_Score,Inventory_Classification_Result):
          sql = "INSERT INTO risk_assess (Department,Equipment,serial_Num,Done_or_Not,signature,Date,A_Equipment_Function,B_Risk_associated_with_equipment_failure,C_Preventive_maintenance_requirement,D_Likelihood_failure,E_Main_area_of_equipment_use,Total_Score,Inventory_Classification_Result) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
          val = (m,k,i,y,l,n,t,r,d,b,u,j,v)
          mycursor.execute(sql, val)
          mydb.commit() 
      return render_template('clinics.html')
   else:
      return render_template('Risk_Assess_clinics.html')
  
@app.route('/upload3')
def upload_form3():
 return render_template('clinics.html')

@app.route('/download/report/execl3')
def download_report3():
  cursor.execute("SELECT Department,Equipment,serial_Num,Done_or_Not,signature,Date,A_Equipment_Function,B_Risk_associated_with_equipment_failure,C_Preventive_maintenance_requirement,D_Likelihood_failure,E_Main_area_of_equipment_use,Total_Score,Inventory_Classification_Result FROM risk_assess")
      #print(Inventory_Classification_Result) 
  result = cursor.fetchall()
  
   #output in bytes
  output = io.BytesIO()
  #create WorkBook object
  workbook = xlwt.Workbook()
  #add a sheet
  sh = workbook.add_sheet('risk_assess Data')
  #style= xlwt.XFStyle()
  #style.alignment.wrap = 1
  style= xlwt.easyxf('alignment: wrap True; align: horiz center')
  tall_style = xlwt.easyxf('font:height 150; ')
  #add headers
  sh.write(0, 0, 'Department',style)
  sh.write(0, 1, 'Equipment Type',style)
  sh.write(0, 2, 'serial Num.',style)
  sh.write(0, 3, 'Done or Not',style)
  sh.write(0, 4, 'Engineer Signature',style)
  sh.write(0, 5, 'Date of assesment',style)
  sh.write(0, 6, 'A. Equipment Function',style)
  sh.write(0, 7, 'B. Risk associated with equipment failure',style)
  sh.write(0, 8, 'C. Preventive maintenance requirement',style)
  sh.write(0, 9, 'D. Likelihood of failure (mean time between failures)',style)
  sh.write(0, 10,'E. Main area of equipment use',style)
  sh.write(0, 11,'Total Score = A + B + (C+D+E)/3',style)
  sh.write(0, 12,'Inventory Classification Result',style)
  idx = 0
  for row in result:
   sh.write(idx+1, 0, row['Department'],style)
   sh.write(idx+1, 1, row['Equipment'],style)
   sh.write(idx+1, 2, row['serial_Num'],style)
   sh.write(idx+1, 3, row['Done_or_Not'],style)
   sh.write(idx+1, 4, row['signature'],style)
   sh.write(idx+1, 5, row['Date'],style)
   sh.write(idx+1, 6, row['A_Equipment_Function'],style)
   sh.write(idx+1, 7, row['B_Risk_associated_with_equipment_failure'],style)
   sh.write(idx+1, 8, row['C_Preventive_maintenance_requirement'],style)
   sh.write(idx+1, 9, row['D_Likelihood_failure'],style)
   sh.write(idx+1, 10, row['E_Main_area_of_equipment_use'],style)
   sh.write(idx+1, 11, row['Total_Score'],style)
   sh.write(idx+1, 12, row['Inventory_Classification_Result'],style)
   idx += 1
   
  #adjust row and col size
  for col_index in range(13):
      sh.col(col_index).width = 256 * 20 
      sh.col(col_index).width
  for row_index in np.arange(1,7):
     print(row_index)
     sh.row(row_index).set_style(tall_style)
   
  workbook.save(output)
  output.seek(0)
  return Response(output, mimetype="application/ms-excel", headers={"Content-Disposition":"attachment;filename=risk_assess_report.xls"})

@app.route('/Otolaryngo')
def Otolaryngo():
   return render_template('Otolaryngo.html')

@app.route('/Otolaryngo_equipment', methods = ['POST', 'GET'])
def Otolaryngo_equipment():
     if request.method == 'POST':
        return render_template('Otolaryngo.html')
     else:
        mycursor.execute("SELECT * FROM devices WHERE Department='ear and nose'")
        row_headers=[x[0] for x in mycursor.description] 
        print(row_headers)
        myresult = mycursor.fetchall()
        #print(myresult)
        data={
         'message':"data retrieved",
         'rec':myresult,
         'header':row_headers
           }
        return render_template('Otolaryngo_equipment.html',data=data)

@app.route('/ppm_laryngo',methods = ['POST', 'GET'])
def ppm():
   if request.method == 'POST': 
      item = request.form.getlist('item')
      serial_no = request.form.getlist('it')
      Date=request.form.getlist('bday')
      maintenance=request.form.getlist('maintenance')
      failure= request.form.getlist('Failure')
      Description=request.form.getlist('Description of equipment failure')
      Cause=request.form.getlist('Cause of failure(if know)')
      Part_maintained=request.form.getlist('Part of machine to be maintained')
      time_required=request.form.getlist('time required')
      parts_replaced=request.form.getlist('Spare parts replaced')
      signature=request.form.getlist('signature')
      comment=request.form.getlist('comment')
      
      for m,k,i,y,l,n,t,r,d,b,u,j in zip(item,serial_no,Date,maintenance,failure,Description,Cause,Part_maintained,time_required,parts_replaced,signature,comment):
          sql = "INSERT INTO ppm_laryngo (item,serial_no,Date,maintenance,failure,Description,Cause,Part_maintained,time_required,parts_replaced,signature,comment) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
          val = (m,k,i,y,l,n,t,r,d,b,u,j)
          mycursor.execute(sql, val)
          mydb.commit()   
         
      return render_template('Otolaryngo.html')
   else:
      return render_template('ppm_laryngo.html')
  
@app.route('/upload2')
def upload_form2():
 return render_template('Otolaryngo.html')

@app.route('/download/report/exec2')
def download_report2():
  cursor.execute("SELECT item,serial_no,Date,maintenance,failure,Description,Cause,Part_maintained,time_required,parts_replaced,signature,comment FROM ppm_laryngo")
  result = cursor.fetchall()
  
   #output in bytes
  output = io.BytesIO()
  #create WorkBook object
  workbook = xlwt.Workbook()
  #add a sheet
  sh = workbook.add_sheet('ppm_laryngo Data')
  #style= xlwt.XFStyle()
  #style.alignment.wrap = 1
  style= xlwt.easyxf('alignment: wrap True; align: horiz center')
  tall_style = xlwt.easyxf('font:height 150; ')
  #add headers
  sh.write(0, 0, 'Equipment type',style)
  sh.write(0, 1, 'Serial_No',style)
  sh.write(0, 2, 'Date',style)
  sh.write(0, 3, 'Maintenance',style)
  sh.write(0, 4, 'Equipment Failure found or Not',style)
  sh.write(0, 5, 'Description of equipment failure',style)
  sh.write(0, 6, 'Cause of failure(if know)',style)
  sh.write(0, 7, 'Part of machine to be maintained',style)
  sh.write(0, 8, 'time required',style)
  sh.write(0, 9, 'Spare parts replaced',style)
  sh.write(0, 10, 'Engineer Signature',style)
  sh.write(0, 11, 'Comments\Action',style)
  idx = 0
  for row in result:
   sh.write(idx+1, 0, row['item'],style)
   sh.write(idx+1, 1, row['serial_no'],style)
   sh.write(idx+1, 2, row['Date'],style)
   sh.write(idx+1, 3, row['maintenance'],style)
   sh.write(idx+1, 4, row['failure'],style)
   sh.write(idx+1, 5, row['Description'],style)
   sh.write(idx+1, 6, row['Cause'],style)
   sh.write(idx+1, 7, row['Part_maintained'],style)
   sh.write(idx+1, 8, row['time_required'],style)
   sh.write(idx+1, 9, row['parts_replaced'],style)
   sh.write(idx+1, 10, row['signature'],style)
   sh.write(idx+1, 11, row['comment'],style)
   idx += 1
   
  #adjust row and col size
  for col_index in range(12):
      sh.col(col_index).width = 256 * 20 
      sh.col(col_index).width
  for row_index in np.arange(1,9):
     print(row_index)
     sh.row(row_index).set_style(tall_style)
   
  workbook.save(output)
  output.seek(0)
   
  return Response(output, mimetype="application/ms-excel", headers={"Content-Disposition":"attachment;filename=ppm_laryngo_report.xls"})
if __name__ == '__main__':
   app.run()