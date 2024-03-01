import argparse
import os

import mlflow


def main(run_id: str, dest_path: str):
    mlflow.artifacts.download_artifacts(run_id=run_id, dst_path=dest_path)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--run-id",
        type=str,
    )
    parser.add_argument(
        "--dest-path",
        type=str,
    )
    args = parser.parse_args()

    print(os.environ["DATABRICKS_TOKEN"])
    print(os.environ["DATABRICKS_HOST"])

    main(run_id=args.run_id, dest_path=args.dest_path)
