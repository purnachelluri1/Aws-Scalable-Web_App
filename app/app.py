from flask import Flask
import socket
import requests
from datetime import datetime

app = Flask(__name__)

def get_metadata(path):
    try:
        return requests.get(
            f"http://169.254.169.254/latest/meta-data/{path}",
            timeout=2
        ).text
    except:
        return "Unavailable"

@app.route("/")
def home():

    instance_id = get_metadata("instance-id")
    az = get_metadata("placement/availability-zone")
    private_ip = get_metadata("local-ipv4")

    return f"""
    <!DOCTYPE html>
    <html>
    <head>
        <title>AWS Infrastructure Dashboard</title>
        <style>
            body {{
                font-family: Arial;
                background: #f5f6fa;
                text-align: center;
                padding-top: 40px;
            }}

            .card {{
                width: 70%;
                margin: auto;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px gray;
            }}

            table {{
                margin: auto;
                width: 80%;
                border-collapse: collapse;
            }}

            td {{
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }}

            h1 {{
                color: #2c3e50;
            }}

            .green {{
                color: green;
                font-weight: bold;
            }}
        </style>
    </head>

    <body>

        <div class="card">

            <h1>AWS Infrastructure Dashboard</h1>

            <h3>Terraform + Docker + Auto Scaling + ALB</h3>

            <table>

                <tr>
                    <td>Instance ID</td>
                    <td>{instance_id}</td>
                </tr>

                <tr>
                    <td>Availability Zone</td>
                    <td>{az}</td>
                </tr>

                <tr>
                    <td>Private IP</td>
                    <td>{private_ip}</td>
                </tr>

                <tr>
                    <td>Container Hostname</td>
                    <td>{socket.gethostname()}</td>
                </tr>

                <tr>
                    <td>Current Time</td>
                    <td>{datetime.now()}</td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td class="green">Healthy</td>
                </tr>

            </table>

        </div>

    </body>
    </html>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)