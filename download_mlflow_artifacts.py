import argparse

import mlflow


def main(run_id: str, dest_path: str = None):
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
        default=None
    )
    args = parser.parse_args()

    main(run_id=args.run_id, dest_path=args.dest_path)
