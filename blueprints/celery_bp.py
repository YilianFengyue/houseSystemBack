from flask import Blueprint, current_app
from exts.celery import celery
import socket, ssl, base64, time
celery_bp = Blueprint("celery", __name__)

# 使用celery实现github异步登录请求
@celery.task
def fetch_github_user_data(code):
    from flask import current_app
    import requests

    try:
        # 获取 access token
        token_response = requests.post(
            current_app.config['GITHUB_ACCESS_TOKEN_URL'],
            headers={"Accept": "application/json"},
            data={
                "client_id": current_app.config['GITHUB_CLIENT_ID'],
                "client_secret": current_app.config['GITHUB_CLIENT_SECRET'],
                "code": code,
                "redirect_uri": current_app.config['GITHUB_CALLBACK_URL'],
            }
        )

        token_json = token_response.json()
        access_token = token_json.get("access_token")
        if not access_token:
            return {"error": "Failed to get access token"}

        # 获取用户基本信息
        user_response = requests.get(
            current_app.config["GITHUB_API_BASE_URL"] + "user",
            headers={"Authorization": f"token {access_token}"}
        )
        user_data = user_response.json()

        # 获取邮箱
        email = user_data.get("email")
        if not email:
            email_response = requests.get(
                current_app.config["GITHUB_API_BASE_URL"] + "user/emails",
                headers={"Authorization": f"token {access_token}"}
            )
            email_list = email_response.json()
            email = next((e["email"] for e in email_list if e.get("primary") and e.get("verified")), None)
            if not email:
                email = f"{user_data['id']}@github.temp"

        return {"email": email}

    except Exception as e:
        return {"error": str(e)}

def send_email_smtp(email, verification_code, subject='邮箱验证码'):
    sender_email = '2298786941@qq.com'
    authorization_code = 'iymnhrycsgredhib'
    if subject == '邮箱验证码':
        text_content = f'你好，这是您的登录验证码 {verification_code}, 请在5分钟以内完成验证'
    else:
        text_content = f'你好，这是您的验证码 {verification_code}, 请在2分钟以内填写验证码'

    msg = (
        f"From: {sender_email}\r\n"
        f"To: {email}\r\n"
        f"Subject: {subject}\r\n"
        "MIME-Version: 1.0\r\n"
        "Content-Type: multipart/mixed; boundary=boundary\r\n"
        "\r\n"
        "--boundary\r\n"
        "Content-Type: text/plain; charset=UTF-8\r\n"
        "\r\n"
        f"{text_content}\r\n"
        "--boundary\r\n"
    )
    endmsg = "\r\n.\r\n"
    mailServer = ("smtp.qq.com", 587)

    try:
        clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        clientSocket.connect(mailServer)
        recv = clientSocket.recv(1024).decode()
        if recv[:3] != '220':
            raise Exception("220 reply not received from server.")

        clientSocket.send(b'HELO Alice\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b'STARTTLS\r\n')
        recv = clientSocket.recv(1024).decode()

        context = ssl.create_default_context()
        clientSocket = context.wrap_socket(clientSocket, server_hostname='smtp.qq.com')

        clientSocket.send(b'HELO Alice\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b'AUTH LOGIN\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(base64.b64encode(sender_email.encode()) + b'\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(base64.b64encode(authorization_code.encode()) + b'\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(f"MAIL FROM:<{sender_email}>\r\n".encode())
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(f"RCPT TO:<{email}>\r\n".encode())
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b"DATA\r\n")
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(msg.encode())
        clientSocket.send(endmsg.encode())
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b'QUIT\r\n')
        time.sleep(1)
        clientSocket.recv(1024)

    finally:
        clientSocket.close()

def send_email_smtp_up(email, verification_code):
    sender_email = '2298786941@qq.com'
    authorization_code = 'iymnhrycsgredhib'
    subject = '申请房东身份'
    text_content = f'你好，这是您的验证码 {verification_code}, 请在2分钟以内填写验证码'

    msg = (
        f"From: {sender_email}\r\n"
        f"To: {email}\r\n"
        f"Subject: {subject}\r\n"
        "MIME-Version: 1.0\r\n"
        "Content-Type: multipart/mixed; boundary=boundary\r\n"
        "\r\n"
        "--boundary\r\n"
        "Content-Type: text/plain; charset=UTF-8\r\n"
        "\r\n"
        f"{text_content}\r\n"
        "--boundary\r\n"
    )
    endmsg = "\r\n.\r\n"
    mailServer = ("smtp.qq.com", 587)

    try:
        clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        clientSocket.connect(mailServer)
        recv = clientSocket.recv(1024).decode()
        if recv[:3] != '220':
            raise Exception("220 reply not received from server.")

        clientSocket.send(b'HELO Alice\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b'STARTTLS\r\n')
        recv = clientSocket.recv(1024).decode()

        context = ssl.create_default_context()
        clientSocket = context.wrap_socket(clientSocket, server_hostname='smtp.qq.com')

        clientSocket.send(b'HELO Alice\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b'AUTH LOGIN\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(base64.b64encode(sender_email.encode()) + b'\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(base64.b64encode(authorization_code.encode()) + b'\r\n')
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(f"MAIL FROM:<{sender_email}>\r\n".encode())
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(f"RCPT TO:<{email}>\r\n".encode())
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b"DATA\r\n")
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(msg.encode())
        clientSocket.send(endmsg.encode())
        recv = clientSocket.recv(1024).decode()

        clientSocket.send(b'QUIT\r\n')
        time.sleep(1)
        clientSocket.recv(1024)

    finally:
        clientSocket.close()

@celery.task
def send_verification_email(email, code):
    send_email_smtp(email, code)

@celery.task
def send_verification_email_up(email, code):
    send_email_smtp_up(email, code)