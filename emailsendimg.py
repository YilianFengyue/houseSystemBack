from socket import *
import base64
import ssl
import os
import time

# 构建完整的邮件内容，包括必要的头部信息
sender_email = '2298786941@qq.com'
recipient_email = '2929459009@qq.com'
# 你需要在 QQ 邮箱设置中开启 SMTP 服务并获取授权码
authorization_code = 'iymnhrycsgredhib'
subject = 'Test Email with Image'
text_content = '明日方舟！mujica！！联动了啊啊啊啊啊啊！！！'
image_path = 'D:\code\RSB_code\LZF_ex02\ex0203\ling.jpg'  # 替换为实际的图片路径

# 读取图片内容
with open(image_path, 'rb') as f:
    image_data = f.read()
image_base64 = base64.b64encode(image_data).decode()
image_filename = os.path.basename(image_path)

# 构建 MIME 格式的邮件内容
msg = (
    f"From: {sender_email}\r\n"
    f"To: {recipient_email}\r\n"
    f"Subject: {subject}\r\n"
    "MIME-Version: 1.0\r\n"
    "Content-Type: multipart/mixed; boundary=boundary\r\n"
    "\r\n"
    "--boundary\r\n"
    "Content-Type: text/plain; charset=UTF-8\r\n"
    "\r\n"
    f"{text_content}\r\n"
    "--boundary\r\n"
    f"Content-Type: image/jpeg; name={image_filename}\r\n"
    "Content-Transfer-Encoding: base64\r\n"
    f"Content-Disposition: attachment; filename={image_filename}\r\n"
    "\r\n"
    f"{image_base64}\r\n"
    "--boundary--\r\n"
)
endmsg = "\r\n.\r\n"

# 选择 QQ 邮箱的 SMTP 服务器
mailServer = ("smtp.qq.com", 587)

try:
    # 创建 socket 和邮件服务器建立 TCP 连接
    clientSocket = socket(AF_INET, SOCK_STREAM)
    clientSocket.connect(mailServer)

    recv = clientSocket.recv(1024).decode()
    print(recv)
    if recv[:3] != '220':
        raise Exception("220 reply not received from server.")

    # 发送 HELO 命令，打印服务器响应
    heloCommand = 'HELO Alice\r\n'
    clientSocket.send(heloCommand.encode())
    recv1 = clientSocket.recv(1024).decode()
    print(recv1)
    if recv1[:3] != '250':
        raise Exception('250 reply not received from server.')

    # 发送 STARTTLS 命令，开启加密连接
    starttlsCommand = 'STARTTLS\r\n'
    clientSocket.send(starttlsCommand.encode())
    recv2 = clientSocket.recv(1024).decode()
    print(recv2)
    if recv2[:3] != '220':
        raise Exception('220 reply not received from server after STARTTLS.')

    # 导入 ssl 模块，对 socket 进行加密
    clientSocket = ssl.wrap_socket(clientSocket)

    # 再次发送 HELO 命令，打印服务器响应
    clientSocket.send(heloCommand.encode())
    recv3 = clientSocket.recv(1024).decode()
    print(recv3)
    if recv3[:3] != '250':
        raise Exception('250 reply not received from server after STARTTLS HELO.')

    # 发送 AUTH LOGIN 命令
    authCommand = 'AUTH LOGIN\r\n'
    clientSocket.send(authCommand.encode())
    recv_auth = clientSocket.recv(1024).decode()
    print(recv_auth)
    if recv_auth[:3] != '334':
        raise Exception('334 reply not received from server after AUTH LOGIN.')

    # 对邮箱地址和授权码进行 Base64 编码
    email_encoded = base64.b64encode(sender_email.encode()).decode()
    password_encoded = base64.b64encode(authorization_code.encode()).decode()

    # 发送编码后的邮箱地址
    clientSocket.send((email_encoded + '\r\n').encode())
    recv_email = clientSocket.recv(1024).decode()
    print(recv_email)
    if recv_email[:3] != '334':
        raise Exception('334 reply not received from server after sending email.')

    # 发送编码后的授权码
    clientSocket.send((password_encoded + '\r\n').encode())
    recv_password = clientSocket.recv(1024).decode()
    print(recv_password)
    if recv_password[:3] != '235':
        raise Exception('235 reply not received from server after sending password.')

    # 发送 MAIL FROM 命令，打印服务器响应
    mailFromCommand = f'MAIL FROM: <{sender_email}>\r\n'
    clientSocket.send(mailFromCommand.encode())
    recv4 = clientSocket.recv(1024).decode()
    print(recv4)
    if recv4[:3] != '250':
        raise Exception('250 reply not received from server after MAIL FROM.')

    # 发送 RCPT TO 命令，打印服务器响应
    rcptToCommand = f'RCPT TO: <{recipient_email}>\r\n'
    clientSocket.send(rcptToCommand.encode())
    recv5 = clientSocket.recv(1024).decode()
    print(recv5)
    if recv5[:3] != '250':
        raise Exception('250 reply not received from server after RCPT TO.')

    # 发送 DATA 命令，打印服务器响应
    dataCommand = 'DATA\r\n'
    clientSocket.send(dataCommand.encode())
    recv6 = clientSocket.recv(1024).decode()
    print(recv6)
    if recv6[:3] != '354':
        raise Exception('354 reply not received from server after DATA.')

    # 发送邮件内容
    clientSocket.send(msg.encode())

    # 消息以单个"."结束
    clientSocket.send(endmsg.encode())
    recv7 = clientSocket.recv(1024).decode()
    print(recv7)
    if recv7[:3] != '250':
        raise Exception('250 reply not received from server after sending message.')

    # 发送 QUIT 命令，获取服务器响应
    quitCommand = 'QUIT\r\n'
    max_retries = 3
    retries = 0
    while retries < max_retries:
        clientSocket.send(quitCommand.encode())
        time.sleep(1)  # 增加 1 秒延迟
        recv8 = clientSocket.recv(1024).decode()
        print(recv8)
        if recv8[:3] == '221':
            break
        retries += 1
    if retries == max_retries:
        raise Exception('221 reply not received from server after QUIT.')

except Exception as e:
    print(f"Error occurred: {e}")
finally:
    # 关闭连接
    if 'clientSocket' in locals():
        clientSocket.close()
