from main import app


def test_index_route():
    response = app.test_client().get("/health")

    data = response.get_json()

    assert response.status_code == 400
    assert data["message"] == "Hello World!"
