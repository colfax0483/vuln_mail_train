from flask import Flask, send_file, request
import os
import json

application = Flask(__name__)

#File Download >> Locate file in Same Directory
#Script File Location : /download/ablscript.exe
#PNG File Location : /download/JJAL.png
@application.route('/download/<file_name>', methods=['GET', 'POST'])
def index(file_name):
    return send_file(file_name,
            attachment_filename=file_name,
            as_attachment=True)

#Gathering Clicked PC Information
@application.route('/fileclick', methods=['POST'])
def fileclick():
    userName = str(request.form['userName'])
    computerName = str(request.form['computerName'])
    ip = str(request.form['ip'])

    print(userName, computerName, ip)
    with open ('result.txt', 'a', encoding='utf-8') as f:
        f.write(f"{userName}\t{computerName}\t{ip}\n")

    return 0

if __name__ == '__main__':
    application.debug = True
    application.run(host="0.0.0.0", port=8080)