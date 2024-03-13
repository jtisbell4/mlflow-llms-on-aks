import json
import subprocess

import requests


def predict(service, data_file):
    command = [
        "kubectl",
        "-n",
        "basic",
        "get",
        "service",
        service,
        "-o",
        "jsonpath={.status.loadBalancer.ingress[0].ip}",
    ]
    result = subprocess.run(command, capture_output=True, text=True)
    ingress_host = result.stdout

    # Load JSON data from the file
    with open(data_file, "r") as file:
        data = json.load(file)

    # Set the URL for the POST request
    url = f"http://{ingress_host}:8080/invocations"

    # Set the headers for the request
    headers = {"Content-Type": "application/json"}

    # Make the POST request
    response = requests.post(url, headers=headers, json=data)

    # Print the response from the server
    return response.text


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--service")
    parser.add_argument("--data")
    args = parser.parse_args()

    print(predict(service=args.service, data_file=args.data))
