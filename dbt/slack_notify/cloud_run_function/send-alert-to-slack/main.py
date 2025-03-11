import functions_framework
import requests
import os
import json
import time


@functions_framework.http
def send_slack_alert(request):
    """HTTP Cloud Function for sending alerts to Slack with colored attachments."""

    slack_webhook_url = os.environ.get("SLACK_WEBHOOK_URL")
    if not slack_webhook_url:
        return (
            json.dumps(
                {"errorMessage": "SLACK_WEBHOOK_URL environment variable is not set."}
            ),
            400,
        )

    try:
        request_json = request.get_json(silent=True)
        calls = request_json["calls"]
        responses = []

        for call in calls:
            title = call[0]  # タイトル
            message = call[1]  # メッセージ本文
            status = call[2]  # ステータス値

            # ステータスに応じて色を設定
            if status.lower() == "success":
                color = "good"  # 緑色
            elif status.lower() == "warning":
                color = "warning"  # 黄色
            elif status.lower() == "error":
                color = "danger"  # 赤色
            else:
                color = "#808080"  # デフォルトはグレー

            # attachmentを含むSlackメッセージを構築
            slack_message = {
                "attachments": [
                    {
                        "color": color,
                        "title": title,
                        "text": message,
                        "footer": "Cloud Run Function Alert",
                        "ts": int(time.time()),
                    }
                ]
            }

            response = requests.post(slack_webhook_url, json=slack_message)
            response.raise_for_status()
            responses.append(f"Slack alert sent: {message}")

        return json.dumps({"replies": responses}), 200

    except Exception as e:
        return json.dumps({"errorMessage": str(e)}), 500
