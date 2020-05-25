from my_jira import *
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def sendEmail(recipsEmailID,subject,message):
    msg = MIMEMultipart('alternative')
    msg['From'] = "name@mycompany.com"
    recips = recipsEmailID
    msg['To'] = ",".join(recips)
    print (msg['To'])
    print (recips)
    msg['Subject'] = subject
    var1 = message
    msg.attach(MIMEText(var1,'html'))
    s = smtplib.SMTP('localhost')
    s.sendmail('',recips,msg.as_string())
    s.close()

html = """<html><table border="1">
<tr><th>S NO</th><th>JIRA</th><th>URL</th><th>SUBJECT</th><th>REPORTER</th><th>STATUS</th></tr>"""
seq_no = 0
for data in d:
    seq_no = seq_no + 1
    html += "<tr><td>{}</td>".format(str(seq_no))
    html += "<td>{}</td>".format(data)
    contents = d[data]
    count = 0
    for content in contents:
        if (count == 0):
            count = count + 1
            html += "<td><a href={}> link</a></td>".format(content)
            continue
        html += "<td>{}</td>".format(content)
    html += "</tr>"
    html += "</tr>"
html += "</table></html>"


sendEmail(['name1@mycompany.com', 'name2@mycompany.com'], "Open CR", html)
