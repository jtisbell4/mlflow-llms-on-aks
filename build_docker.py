import mlflow


def build(run_id: str, image_name: str):
    model_uri = f"runs:/{run_id}/model"
    return mlflow.models.build_docker(
        model_uri=model_uri, name=image_name, enable_mlserver=True
    )


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--run-id")
    parser.add_argument("--image-name")
    args = parser.parse_args()

    build(run_id=args.run_id, image_name=args.image_name)
